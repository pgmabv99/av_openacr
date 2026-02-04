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
// Source: cpp/atf_rdk/produce.cpp -- rdkafka produce  tool
//

#include "include/algo.h"
#include "include/atf_rdk.h"

// Delivery report callback. called in the same thread that calls rd_kafka_poll() -our main/only thread
void atf_rdk::msg_produce_delivery_callback(rd_kafka_t *rk, const rd_kafka_message_t *rkmessage, void *opaque) {
    (void)rk;
    (void)opaque;

    if (rkmessage->payload == nullptr || rkmessage->len == 0) {
        prlog("atf_rdk.err"
              << Keyval("comment", "!!!!Null payload in delivery callback")
              << Keyval("error", rd_kafka_err2str(rkmessage->err))
              );
    }
    strptr rkmessage_p((char*)rkmessage->payload, rkmessage->len);
    cstring  rkmessage_str(rkmessage_p);
    // null term , but may be missing for some
    const char *topic = rkmessage->rkt ? rd_kafka_topic_name(rkmessage->rkt) : "<no-topic>";
    // auto msg= atf_rdk::ind_msg_Find(rkmessage_str);

    if (rkmessage->err) {
        //
        _db.mcb.err_ondelivery_count++;
        // print initial errors only
        if(_db.mcb.err_ondelivery_count <= 5) {
            prlog("atf_rdk.err"
                  << Keyval("comment", "Message delivery failed: ")
                  << Keyval("error", rd_kafka_err2str(rkmessage->err))
                  << Keyval("msg", rkmessage_str)
                  << Keyval("topic", topic)
                  );

        }
        if(_db.mcb.err_ondelivery_count == 5) {
            prlog("atf_rdk.err"
                  << Keyval("comment", "furher errors will be suppressed")
                  );
        }
    } else {
        // Successful delivery

        // get latency from message payload
        i64 time_now = algo::CurrUnTime().value ;
        algo::StringIter line_it(rkmessage_str);
        auto time0x_str = GetTokenChar(line_it,'/');
        i64 time0x = ParseI64(time0x_str,0);    // when the message was created

        // auto run_id_str = GetTokenChar(line_it,'/');
        i64 latency = time_now - time0x;
        verblog2("atf_rdk.info"
                 << Keyval("comment", "Delivered")
                 << Keyval("topic", topic)
                 << Keyval("msg", rkmessage_str)
                 << Keyval("partition", rkmessage->partition)
                 << Keyval("offset", rkmessage->offset)
                 << Keyval("latency_us", latency/1000)
                 );
        _db.mcb.msg_ack_count++;
        _db.mcb.msg_lat_total += latency;
    }
}


// Create topic object
void atf_rdk::ftopic_crt(int itopic ) {
    tempstr topic_name;
    topic_name << _db.cmdline.topic << itopic;
    auto ftopic = &atf_rdk::topic_Alloc();
    ftopic->topic = topic_name;
    //print 10% progress

    u64 step = (_db.cmdline.max_topics < 10) ? 1 : _db.cmdline.max_topics / 10;
    if(itopic % step ==0){
        verblog("atf_rdk.info" << Keyval("comment", "Creating rdkafka topic object") << Keyval("topic", topic_name));
    }
    ftopic->rkt = (u8*)rd_kafka_topic_new((rd_kafka_t*)_db.mcb.rk, Zeroterm(topic_name), nullptr);
    if (!ftopic->rkt) {
        prlog("atf_rdk.err"<< Keyval("comment","Failed to create topic handle: ") << Keyval("error", rd_kafka_err2str(rd_kafka_last_error())));
        rd_kafka_destroy((rd_kafka_t*)_db.mcb.rk);
        exit(1);
    }
    vrfy_(topic_XrefMaybe(*ftopic));
}

// Delete topic object
void  atf_rdk::ftopic_del(int itopic ) {
    tempstr topic_name;
    topic_name << _db.cmdline.topic << itopic;
    auto ftopic = atf_rdk::ind_topic_Find(topic_name);
    if(ftopic){
        //print 10% progress
        u64 step = (_db.cmdline.max_topics < 10) ? 1 : _db.cmdline.max_topics / 10;
        if(itopic % step ==0){
            verblog("atf_rdk.info" << Keyval("comment", "Deleting rdkafka topic object") << Keyval("topic", topic_name));
        }
        rd_kafka_topic_destroy((rd_kafka_topic_t*)ftopic->rkt);
        topic_Delete(*ftopic);
    }
}




// Initialize producer
void atf_rdk::produce_init(){
    // Configure producer
    mcb_init();

    char errstr[512];   //todo . can this cstring
    // Create configuration object
    rd_kafka_conf_t *conf = rd_kafka_conf_new();
    if (!conf) {
        prlog("atf_rdk.err" << Keyval("comment", "Failed to create configuration object"));
        exit(1);
    }
    // Set delivery report callback
    rd_kafka_conf_set_dr_msg_cb(conf, msg_produce_delivery_callback);

    vrfy_(rdk_kafka_conf_set_wrap(conf, "client.id", "atf_rdk_produce")==0);
    vrfy_(rdk_kafka_conf_set_wrap(conf, "bootstrap.servers", _db.cmdline.broker)==0);
    /* Increase local producer queue: message count */
    vrfy_(rdk_kafka_conf_set_wrap(conf, "queue.buffering.max.messages", "1000000") == 0);
    /* Increase local producer queue: memory (kbytes) */
    vrfy_(rdk_kafka_conf_set_wrap(conf, "queue.buffering.max.kbytes", "1048576") == 0);

    // interactive experiment.todo
    bool interactive =false;
    if (interactive) {
        /* linger for interactive*/
        vrfy_(rdk_kafka_conf_set_wrap(conf, "sticky.partitioning.linger.ms", "1") == 0);
        /*  linger for interactive */
        vrfy_(rdk_kafka_conf_set_wrap(conf, "queue.buffering.max.ms", "1") == 0);
    }

    // Enable rdkafka statistics callback
    if(_db.cmdline.rd_stats){
        vrfy_(rdk_kafka_conf_set_wrap(conf, "statistics.interval.ms", "100") == 0);
        rd_kafka_conf_set_stats_cb(conf,rdk_stats_callback);
    }

    // Dump configuration when rd_stats
    if(_db.cmdline.rd_stats){
        size_t cnt;
        const char **entries = rd_kafka_conf_dump(conf, &cnt);
        prlog("atf_rdk.info"
              << Keyval("comment", "Kafka configuration dump:")
              << Keyval("cnt of keys", cnt));
        for (size_t i = 0; i < cnt; i += 2) {   // every 2 strings is key + value
            const char *key = entries[i] ? entries[i] : "<null>";
            const char *val = entries[i+1] ? entries[i+1] : "<null>";
            prlog("atf_rdk.rd_kafka_conf" << Keyval("key", key) << Keyval("value", val));
        }
        rd_kafka_conf_dump_free(entries, cnt);
    }

    // Create producer instance
    _db.mcb.rk = (u8*)rd_kafka_new(RD_KAFKA_PRODUCER, conf, errstr, sizeof(errstr));
    if (!_db.mcb.rk) {
        prlog("atf_rdk.err" << Keyval("comment", "Failed to create producer: ") << Keyval("error", errstr));
        rd_kafka_conf_destroy(conf);
        exit(1);
    }
    conf = nullptr;  // Configuration is now owned by rk

    // Create topic handles
    for (uint64_t itopic=0; itopic<_db.cmdline.max_topics; itopic++) {
        if(_db.mcb.stop){
            prlog("atf_rdk.info" << Keyval("comment", "stopping topic creation due to stop signal"));
            break;
        }
        ftopic_crt(itopic);
    }
    verblog("atf_rdk.info" << Keyval("comment", "All topics created"));
}

// One  run of producer
void atf_rdk::produce_run() {
    _db.mcb.time0 = algo::CurrSchedTime();
    _db.mcb.max_msg_all_topics = _db.cmdline.max_msgs*_db.cmdline.max_topics;
    prlog("atf_rdk.info"
          << Keyval("comment", "Start producing to multiple topics")
          << Keyval("broker", _db.cmdline.broker)
          << Keyval("max_topics", _db.cmdline.max_topics)
          );
    if (!_db.cmdline.use_stdin){
        prlog("atf_rdk.info"
              << Keyval("comment", "Start producing to multiple topics")
              << Keyval("max_msgs", _db.cmdline.max_msgs)
              << Keyval("max_msg_all_topics", _db.mcb.max_msg_all_topics)
              );
    }
    // Initialize producer
    produce_init();

    // Produce messages
    if (_db.cmdline.use_stdin){
        verblog("atf_rdk.info" << Keyval("comment", "Entering Mainloop with io hook/stdin"));
        verblog("atf_rdk.info" << Keyval("comment", "ignoring msg_rate, max_msgs, msg_max_size parameters"));
        _db.terminal.fildes=algo::Fildes(0);
        algo::SetBlockingMode(_db.terminal.fildes,false);
        callback_Set0(_db.terminal,msg_produce_callback_io);
        IOEvtFlags flags;
        read_Set(flags,true);
        IohookAdd(_db.terminal,flags);
        _db.rdk_mon = true;
        MainLoop();
    } else {
        verblog("atf_rdk.info" << Keyval("comment", "Entering Mainloop with time hook"));
        hook_Set0(_db.th_msg, msg_produce_callback_timehook);
        ThScheduleRecur(_db.th_msg, algo::ToSchedTime(1./(double)_db.cmdline.msg_rate));
        _db.rdk_mon = true;
        MainLoop();
    }
    verblog("atf_rdk.info" << Keyval("comment", "Exiting loop"));

    // Finalize producer
    produce_del();
    // Print summary
    produce_summary();
    return ;
}

// Produce progress report
void atf_rdk::produce_progress(){
    auto msg_ack_count_delta = _db.mcb.msg_ack_count - _db.mcb.msg_ack_count_last;
    auto msg_lat_total_delta = _db.mcb.msg_lat_total - _db.mcb.msg_lat_total_last;
    prlog("atf_rdk.info"
          << Keyval("comment", "Produce Progress")
          << Keyval("elapsed(sec)", algo::ElapsedSecs(_db.mcb.time0, algo::CurrSchedTime()))
          << Keyval("msg_ack_count", _db.mcb.msg_ack_count)
          << Keyval("msg_req_count", _db.mcb.msg_req_count)
          << Keyval("pending", _db.mcb.msg_req_count - _db.mcb.msg_ack_count)
          << Keyval("lat_avg_us(running)", msg_ack_count_delta ? (msg_lat_total_delta / msg_ack_count_delta) / (int)1e3 : 0)
          );
    _db.mcb.msg_ack_count_last = _db.mcb.msg_ack_count;
    _db.mcb.msg_lat_total_last = _db.mcb.msg_lat_total;
}

// Print summary of produced messages
void atf_rdk::produce_summary() {
    tempstr msg_rate;
    if(_db.cmdline.use_stdin){
        msg_rate = "external";
    } else{
        msg_rate << _db.cmdline.msg_rate;
    }
    prlog("atf_rdk.produce_summary"
          << Keyval("broker", _db.cmdline.broker)
          << Keyval("elapsed(sec)", algo::ElapsedSecs(_db.mcb.time0, algo::CurrSchedTime()))
          << Keyval("max_topics", _db.cmdline.max_topics)
          << Keyval("msg_enq", _db.mcb.msg_req_count)
          << Keyval("msg_ack", _db.mcb.msg_ack_count)
          << Keyval("msg_rate_per_sec", msg_rate)
          << Keyval("lat_avg_us", _db.mcb.msg_ack_count ? (_db.mcb.msg_lat_total / _db.mcb.msg_ack_count) / 1000 : 0)
          );
    if(_db.cmdline.rd_stats){
        produce_rd_stats();
        prlog("atf_rdk.info"
              << Keyval("comment", "Wrote statistics to file")
              << Keyval("file", _db.mcb.rd_stats_file)
              );
    }
    prlog("\n");
}

// create file with rd_kafka statistics
void atf_rdk::produce_rd_stats() {
    lib_json::FParser json_parser;
    lib_json::JsonParse(json_parser, _db.mcb.rd_stats_json);

    tempstr out;
    lib_json::JsonSerialize(json_parser.root_node, out, true);
    cstring broker2= _db.cmdline.broker;;
    Replace(broker2, ":", "_");
    Replace(broker2, ".", "_");
    _db.mcb.rd_stats_file = DirFileJoin(_db.mcb.logs_dir,tempstr()<<"rd_stats_"<<broker2<<".json");
    StringToFile(out,_db.mcb.rd_stats_file);
}

// Deinitialize producer. Flush messages and delete topics
void atf_rdk::produce_del() {

    // Flush remaining messages with progress reporting
    int kFlushStepMs   = 5000;   // per-iteration flush
    int kMaxFlush = 10;      // total max wait = 50s

    int outq_before = rd_kafka_outq_len((rd_kafka_t*)_db.mcb.rk);
    int outq_after = 0;

    _db.mcb.stop = false; // reset stop flag for flush loop

    verblog("atf_rdk.info"
            << Keyval("comment", "Flushing remaining messages")
            << Keyval("outq_start", outq_before));

    for (int iflush = 1; iflush <= kMaxFlush; ++iflush) {
        if(_db.mcb.stop) {
            prlog("atf_rdk.info"
                  << Keyval("comment", "Flush interrupted by stop signal")
                  << Keyval("iflush", iflush)
                  );
            break;
        }
        rd_kafka_resp_err_t err = rd_kafka_flush((rd_kafka_t*)_db.mcb.rk, kFlushStepMs);
        outq_after = rd_kafka_outq_len((rd_kafka_t*)_db.mcb.rk);

        if (err == RD_KAFKA_RESP_ERR_NO_ERROR && outq_after == 0) {
            verblog("atf_rdk.info"
                    << Keyval("comment", "Flush completed")
                    << Keyval("iterations", iflush)
                    << Keyval("outq_final", outq_after));
            break;
        }

        verblog("atf_rdk.info"
                << Keyval("comment", "Flush progress")
                << Keyval("iflush", iflush)
                << Keyval("outq_after", outq_after)
                << Keyval("error", rd_kafka_err2str(err)));

        if (iflush == kMaxFlush) {
            prlog("atf_rdk.err"
                  << Keyval("comment", "Flush did not complete")
                  << Keyval("iflush", iflush)
                  << Keyval("outq_start", outq_before)
                  << Keyval("outq_final", outq_after)
                  << Keyval("total_timeout_ms", kFlushStepMs * kMaxFlush));
        }
    }


    if(outq_after > 0) {
        prlog("atf_rdk.err"
              << Keyval("comment", "skipping topic deletion due to pending messages in outq")
              );

    }  else{
        // Delete topic handles if all is flushed.
        for (uint64_t itopic=0; itopic<_db.cmdline.max_topics; itopic++) {
            ftopic_del(itopic);
        }
    }

    // Clean up min level kafka resources
    verblog("atf_rdk.info" << Keyval("comment", "Cleaning up resources"));
    rd_kafka_destroy((rd_kafka_t*)_db.mcb.rk);

    // delete all messages/topics left in index (due to errors)
    ind_topic_Cascdel();
    zd_topic_Cascdel();
}


// Produce a single message to a specific topic
void atf_rdk::msg_produce(algo::memptr msg_memptr  ) {
    // select topic
    uint64_t itopic = _db.mcb.imsg % _db.cmdline.max_topics;
    // Find topic object
    tempstr topic_name(tempstr()<< _db.cmdline.topic << itopic);
    auto ftopic = atf_rdk::ind_topic_Find(topic_name);
    vrfy_(ftopic);

    // Produce message
    int produce_result = rd_kafka_produce((rd_kafka_topic_t*)ftopic->rkt, RD_KAFKA_PARTITION_UA, RD_KAFKA_MSG_F_COPY, (void*)msg_memptr.elems,
                                          msg_memptr.n_elems, nullptr, 0, nullptr);
    if (produce_result == -1) {
        _db.mcb.err_onproduce_count++;
        if (_db.mcb.err_onproduce_count <= 5) {
            prlog("atf_rdk.err"
                  << Keyval("comment", "Failed to produce message")
                  << Keyval("msg", memptr_ToStrptr(msg_memptr))
                  << Keyval("imsg", _db.mcb.imsg)
                  << Keyval("topic", topic_name)
                  << Keyval("error", rd_kafka_err2str(rd_kafka_last_error()))
                  );
        }
        if (_db.mcb.err_onproduce_count == 5) {
            prlog("atf_rdk.err"
                  << Keyval("comment", "error producing messages, further errors will be suppressed")
                  );
        }
    } else {
        verblog2("atf_rdk.info"
                 << Keyval("comment", "Enqueued")
                 << Keyval("topic", topic_name)
                 << Keyval("imsg", _db.mcb.imsg)
                 << Keyval("msg", memptr_ToStrptr(msg_memptr))
                 );
        atf_rdk::_db.mcb.msg_req_count++;
    }

    // Poll for delivery reports. must have this to trigger delivery report callback and all comms
    rd_kafka_poll((rd_kafka_t*)atf_rdk::_db.mcb.rk, 0);
    _db.mcb.imsg++;
}

// Build message
algo::memptr  atf_rdk::msg_bld(strptr msg_pay) {
    tempstr msg;
    msg
        << algo::CurrUnTime().value
        <<"/"<< _db.cmdline.run_id
        <<"/" << _db.mcb.imsg
        <<"/"<< msg_pay
        ;
    ary_RemoveAll(_db.mcb.msg_buf);
    ary_ReadStrptrMaybe(_db.mcb.msg_buf,msg);
    return ary_Getary(_db.mcb.msg_buf);
}

// time hook ACR callback
void atf_rdk::msg_produce_callback_timehook() {
    // prlog("atf_rdk.info" << Keyval("comment", "........msg_produce_callback_timehook invoked"));
    if (!_db.mcb.stop && _db.mcb.imsg <  _db.mcb.max_msg_all_topics) {
        // Build message payload
        algo::memptr msg_memptr = msg_bld("aaaaa");
        // produce message
        msg_produce(msg_memptr);
    } else {
        bh_timehook_Remove(_db.th_msg);
        // algo_lib::ReqExitMainLoop();  // this does not allow resume
        _db.rdk_mon = false;
        verblog("atf_rdk.info" << Keyval("comment", "requesting exit from MainLoop "));
    }
}

// io hook ACR  callback
void atf_rdk::msg_produce_callback_io() {
    char buf[8192];
    int rc=0;
    bool ctrld = false;
    rc=read(_db.terminal.fildes.value,&buf,sizeof(buf)-1);
    if (rc>0) {
        strptr inp(buf,rc-1);
        tempstr inp_str(inp);
        // build message
        algo::memptr msg_memptr = msg_bld(inp_str);
        // produce message
        msg_produce(msg_memptr);
    } else if (rc==-1 && errno==EAGAIN) {
    } else {
        // ctrl/d ?
        ctrld = true;
    }
    if(ctrld  || _db.mcb.stop ) {
        IohookRemove(_db.terminal);
        // algo_lib::ReqExitMainLoop();
        _db.rdk_mon = false;
        verblog("atf_rdk.info" << Keyval("comment", "requesting exit from MainLoop "));
    }
}
