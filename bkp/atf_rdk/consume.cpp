// Copyright (C) 2026 AlgoRND
//
// License: GPL
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.
//
// Target: atf_rdk (exe) -- atf_rdk target
// Exceptions: yes
// Source: cpp/atf_rdk/consume.cpp -- rdkafka consume  tool
//

#include "include/algo.h"
#include "include/atf_rdk.h"

// Message consumption
void atf_rdk::msg_consume(rd_kafka_message_t *rkmessage, void *opaque){
    (void)opaque;

    // Always display topic/partition
    const char *topic = rkmessage->rkt ? rd_kafka_topic_name(rkmessage->rkt): "<unknown>";
    int32_t partition = rkmessage->partition;
    if (rkmessage->err) {
        prlog("atf_rdk.err"
              << Keyval("comment", "Consumer error")
              << Keyval("topic", topic)
              << Keyval("partition", partition)
              << Keyval("error", rd_kafka_err2str(rkmessage->err))
              );
        if (rkmessage->err == RD_KAFKA_RESP_ERR__PARTITION_EOF){
            prlog("atf_rdk.info"
                  << Keyval("comment", "Reached end of partition")
                  );
        }
    } else {
        strptr rkmessage_p((char*)rkmessage->payload, rkmessage->len);
        cstring  rkmessage_str(rkmessage_p);;

        // get latency from message payload
        i64 time_now = algo::CurrUnTime().value;
        algo::StringIter line_it(rkmessage_str);
        auto time0x_str = GetTokenChar(line_it,'/');
        i64 time0x = ParseI64(time0x_str,0);    // when the message was created

        i64 latency = time_now - time0x;
        verblog2("atf_rdk.info"
                 << Keyval("comment", "Received message")
                 << Keyval("topic", topic)
                 << Keyval("partition", partition)
                 << Keyval("offset", rkmessage->offset)
                 << Keyval("len", rkmessage->len)
                 << Keyval("msg", rkmessage_p)
                 << Keyval("latency_us", latency/(int)1e3)
                 << Keyval("latency_sec", latency/(int)1e9)
                 );
        rd_kafka_resp_err_t commit_err =
            rd_kafka_commit_message((rd_kafka_t*)_db.mcb.rk, rkmessage, 0);
        if (commit_err) {
            prlog("atf_rdk.err"
                  << Keyval("comment", "Commit failed")
                  << Keyval("error", rd_kafka_err2str(commit_err)));
        }
        _db.mcb.msg_consume_count++;
        _db.mcb.msg_consume_lat_total += latency;
    }
}

// Initialize consumer
void atf_rdk::consume_init() {
    // Initialize consumer
    mcb_init();
    char errstr[512];
    // Create configuration object
    rd_kafka_conf_t *conf = rd_kafka_conf_new();
    if (!conf) {
        prlog("atf_rdk.err" << Keyval("comment", "Failed to create configuration object"));
        exit(1);
    }

    // Configure consumer
    vrfy_(rdk_kafka_conf_set_wrap(conf, "client.id", tempstr()<<"atf_rdk_"<<_db.cmdline.run_id)==0);
    vrfy_(rdk_kafka_conf_set_wrap(conf, "bootstrap.servers", _db.cmdline.broker)==0);
    vrfy_(rdk_kafka_conf_set_wrap(conf, "group.id", "test_group_id")==0);
    // // prevent immediate rebalance. possible later ??
    // vrfy_(rdk_kafka_conf_set_wrap(conf, "group.instance.id", _db.cmdline.run_id)==0);
    vrfy_(rdk_kafka_conf_set_wrap(conf, "auto.offset.reset", "earliest")==0);
    vrfy_(rdk_kafka_conf_set_wrap(conf, "enable.auto.commit", "false")==0);


    // Set rebalance callback. NOT needed . use default
    // rd_kafka_conf_set_rebalance_cb(conf, consume_rebalance_callback);

    // Create consumer instance
    verblog2("atf_rdk.info" << Keyval("comment", "Creating consumer"));
    _db.mcb.rk = (u8*)rd_kafka_new(RD_KAFKA_CONSUMER, conf, errstr, sizeof(errstr));
    if (!_db.mcb.rk) {
        prlog("atf_rdk.err" << Keyval("comment", "Failed to create consumer: ") << Keyval("error", errstr));
        rd_kafka_conf_destroy(conf);
        exit(1);
    }

    conf = nullptr; // Configuration is now owned by rk

    // Enable consumer polling
    verblog2("atf_rdk.info" << Keyval("comment", "Setting consumer polling"));
    rd_kafka_resp_err_t rd_kafka_resp_err = rd_kafka_poll_set_consumer((rd_kafka_t*)_db.mcb.rk);
    if (rd_kafka_resp_err != RD_KAFKA_RESP_ERR_NO_ERROR) {
        prlog("atf_rdk.err"
              << Keyval("comment", "Failed to set consumer polling")
              << Keyval("error", rd_kafka_err2str(rd_kafka_resp_err)));
        rd_kafka_destroy((rd_kafka_t*)_db.mcb.rk);
        exit(1);
    }

    // Create topic-partition list
    verblog2("atf_rdk.info" << Keyval("comment", "Creating topic-partition list"));
    _db.mcb.topic_list = (u8*)rd_kafka_topic_partition_list_new(_db.cmdline.max_topics);
    frep_(i, _db.cmdline.max_topics) {
        tempstr topic_name;
        topic_name << _db.cmdline.topic << i;
        rd_kafka_topic_partition_list_add((rd_kafka_topic_partition_list_t *)_db.mcb.topic_list, Zeroterm(topic_name), RD_KAFKA_PARTITION_UA);
        verblog2("atf_rdk.info"
                 << Keyval("comment", "Added topic to subscription list")
                 << Keyval("topic", topic_name)
                 );
    }

    // Subscribe to topics
    verblog2("atf_rdk.info" << Keyval("comment", "Subscribing to topics"));
    rd_kafka_resp_err = rd_kafka_subscribe((rd_kafka_t*)_db.mcb.rk, (rd_kafka_topic_partition_list_t *)_db.mcb.topic_list);
    if (rd_kafka_resp_err != RD_KAFKA_RESP_ERR_NO_ERROR) {
        prlog("atf_rdk.err"
              << Keyval("comment", "Failed to subscribe")
              << Keyval("error", rd_kafka_err2str(rd_kafka_resp_err)));
        rd_kafka_topic_partition_list_destroy((rd_kafka_topic_partition_list_t *)_db.mcb.topic_list);
        rd_kafka_destroy((rd_kafka_t*)_db.mcb.rk);
        exit(1);
    }

}

// Finalize consumer
void atf_rdk::consume_del() {
    prlog("atf_rdk.info" << Keyval("comment", "Destroying consumer"));

    verblog2("atf_rdk.info" << Keyval("comment", "Destroying topic-partition list"));
    rd_kafka_topic_partition_list_destroy((rd_kafka_topic_partition_list_t *)_db.mcb.topic_list);

    verblog2("atf_rdk.info" << Keyval("comment", "Closing consumer"));
    rd_kafka_consumer_close((rd_kafka_t*)_db.mcb.rk);

    verblog2("atf_rdk.info" << Keyval("comment", "Destroying consumer"));
    rd_kafka_destroy((rd_kafka_t*)_db.mcb.rk);

}

// Consume progress report
void atf_rdk::consume_progress(){
    auto msg_consume_count_delta = _db.mcb.msg_consume_count - _db.mcb.msg_consume_count_last;
    auto msg_consume_lat_total_delta = _db.mcb.msg_consume_lat_total - _db.mcb.msg_consume_lat_total_last;
    prlog("atf_rdk.info"
          << Keyval("comment", "Consume Progress")
          << Keyval("elapsed(sec)", algo::ElapsedSecs(_db.mcb.time0, algo::CurrSchedTime()))
          << Keyval("msg_consume_count", _db.mcb.msg_consume_count)
          << Keyval("poll_consume_count", _db.mcb.poll_consume_count)
          << Keyval("lat_avg_sec(running)", msg_consume_count_delta ? (msg_consume_lat_total_delta / msg_consume_count_delta) / (int)1e9 : 0)
          );
    _db.mcb.msg_consume_count_last = _db.mcb.msg_consume_count;
    _db.mcb.msg_consume_lat_total_last = _db.mcb.msg_consume_lat_total;
}

// Print consume summary
void atf_rdk::consume_summary() {
    prlog("atf_rdk.consume_summary"
          << Keyval("broker", _db.cmdline.broker)
          << Keyval("elapsed(sec)", algo::ElapsedSecs(_db.mcb.time0, algo::CurrSchedTime()))
          << Keyval("msg_consume_count", _db.mcb.msg_consume_count)
          << Keyval("poll_consume_count", _db.mcb.poll_consume_count)
          << Keyval("lat_avg_sec", (_db.mcb.msg_consume_count>0) ? (_db.mcb.msg_consume_lat_total/ _db.mcb.msg_consume_count)/(int)1e9 : 0)
          );
}

// consumer step for MainLoop
void atf_rdk::rdk_consume_poll_Step() {
    // prlog("atf_rdk.info" << Keyval("comment", "........msg_consume invoked"));
    if (!_db.mcb.stop) {
        // Required for heartbeats & rebalance protocol ??? grok
        // rd_kafka_poll((rd_kafka_t*)_db.mcb.rk, 0);
        //
        // rd_kafka_message_t *msg = rd_kafka_consumer_poll((rd_kafka_t*)_db.mcb.rk, 0); // Poll without wait
        rd_kafka_message_t *msg = rd_kafka_consumer_poll((rd_kafka_t*)_db.mcb.rk, 100); // Poll  with 100ms wait (grok)
        if (msg){
            msg_consume(msg, nullptr);
            rd_kafka_message_destroy(msg);
        } else {
            // verblog2("atf_rdk.info"
            //          << Keyval("comment", "No message received in poll interval")
            //          );
        }
        _db.mcb.poll_consume_count++;
    } else {
        _db.rdk_mon = false;
        _db.rdk_consume_poll = false;
        verblog("atf_rdk.info" << Keyval("comment", "requesting exit from MainLoop "));
    }
}

// One  run of consumer
void atf_rdk::consume_run() {
    _db.mcb.time0 = algo::CurrSchedTime();
    prlog("atf_rdk.info"
          << Keyval("comment", "Start consuming from multiple topics")
          << Keyval("broker", _db.cmdline.broker)
          << Keyval("run_id", _db.cmdline.run_id)
          << Keyval("max_topics", _db.cmdline.max_topics)
          );
    // Initialize consumer
    consume_init();
    // consume loop
    verblog("atf_rdk.info" << Keyval("comment", "Entering Mainloop with consume step"));
    _db.rdk_consume_poll = true;
    _db.rdk_mon = true;
    MainLoop();
    verblog("atf_rdk.info" << Keyval("comment", "Exiting loop"));
    // Finalize consumer
    consume_del();
    // Print summary
    consume_summary();
    return ;
}

void atf_rdk::consume_rebalance_callback(rd_kafka_t *rk, rd_kafka_resp_err_t err,rd_kafka_topic_partition_list_t *partitions, void *opaque){
    (void)opaque;
    prlog("atf_rdk.info"
          << Keyval("comment", "Rebalance callback invoked")
          // << Keyval("error", rd_kafka_err2str(err))
          );
    if (err == RD_KAFKA_RESP_ERR__ASSIGN_PARTITIONS) {
        prlog("atf_rdk.info"
              << Keyval("comment", "call rd_kafka_assign")
              << Keyval("n_partitions", partitions->cnt)
              );
        rd_kafka_assign(rk, partitions);
    } else {
        prlog("atf_rdk.info"
              << Keyval("comment", "call rd_kafka_assign with NULL")
              );
        rd_kafka_assign(rk, NULL);
    }
}
