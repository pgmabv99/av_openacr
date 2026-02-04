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
// Source: cpp/atf_rdk/atf_rdk.cpp -- rdkafka testing tool
//

#include "include/algo.h"
#include "include/algo.h"
#include "include/atf_rdk.h"

void atf_rdk::Main() {
    // Register signal handlers
    signal(SIGINT, signal_handler);
    signal(SIGTERM, signal_handler);
    dir_init();

    if(_db.cmdline.n_c == 0  && _db.cmdline.n_p == 0) {
        test_custom();
    } else if (_db.cmdline.n_c == 1  && _db.cmdline.n_p == 0){
        //same process consume
        consume_run();
    } else if( _db.cmdline.n_p == 1 && _db.cmdline.n_c == 0){
        // same process produce
        produce_run();
    } else {
        prlog("atf_rdk.err"
              << Keyval("comment", "multiple consumer/producer runners not implemented yet")
              );
    }

}

// Test mltiple backends in one session
void atf_rdk::test_custom() {
    prlog("atf_rdk.info" << Keyval("comment", "compare multipe backends in one run"));
    prlog("atf_rdk.info" << Keyval("comment", "override cmdline parameters for test!!!!!!!!!!\n"));

    // _db.cmdline.max_msgs = 1e6;
    // _db.cmdline.max_msgs = 1e3;
    // _db.cmdline.max_msgs = 2;
    // _db.cmdline.max_msgs = 1e3;

    // _db.cmdline.max_topics = 1e5;
    // _db.cmdline.max_topics = 1;
    // _db.cmdline.max_topics = 1e4*1;
    // _db.cmdline.max_topics = 10;

    // _db.cmdline.msg_rate = 1e4;
    // _db.cmdline.msg_rate = 1;

    _db.cmdline.n_p = 1;

    _db.cmdline.broker = "nj1-4.kafka-1.ext-0:1643";
    test_produce_mult_session();

    // _db.cmdline.broker = "nj1-4.x2-3.ext-0:1519";
    // test_produce_mult_session();

    _db.cmdline.broker = "localhost:54005";
    // _db.cmdline.broker = "localhost:9092";
    test_produce_mult_session();

    return ;
}

// Test producing messages in one session
void atf_rdk::test_produce_mult_session() {
    auto N=1;
    frep_(i,N){
        produce_run();
    }
    return ;
}

// montor  step for MainLoop
void atf_rdk::rdk_mon_Step() {
    if(_db.cmdline.progress){
        if(_db.cmdline.n_p ==1 ){
            produce_progress();
        } else if (_db.cmdline.n_c == 1  ) {
            consume_progress();
        }
    }
}

// configure  single entry in rdkafka config
int  atf_rdk::rdk_kafka_conf_set_wrap(rd_kafka_conf_t *conf, strptr p_key , strptr p_value) {
    char errstr[512];
    int rc =0;
    tempstr key(p_key);
    tempstr value(p_value);
    verblog2("atf_rdk.info"
             << Keyval("comment", "Setting rdkafka config")
             << Keyval("key", key)
             << Keyval("value", value)
             );
    if (rd_kafka_conf_set(conf, Zeroterm(key), Zeroterm(value)  , errstr, sizeof(errstr)) != RD_KAFKA_CONF_OK) {
        prlog("atf_rdk.err"
              << Keyval("comment", "Failed to set  ")
              << Keyval("key", key)
              << Keyval("value", value)
              << Keyval("error", errstr)
              );
        rd_kafka_conf_destroy(conf);
        rc=1;
    }
    return rc;
}


// Statistics callback
int atf_rdk::rdk_stats_callback(rd_kafka_t *rk, char *json, size_t json_len, void *opaque) {
    (void)rk;
    (void)opaque;

    // json is NOT null-terminated
    strptr json_p(json, json_len);
    // save stats
    _db.mcb.rd_stats_json = json_p;
    return 0; // must return 0
}

// init fixed subfolder for solo capture
void atf_rdk::dir_init(){
    if(_db.cmdline.rd_stats){
        // only if rd_stats is enabled, to allow parallel runs/todo
        _db.mcb.logs_dir = "temp/atf_rdk_logs";
        auto rc=SysCmd(tempstr()<<"mkdir -p  " << _db.mcb.logs_dir);
        vrfy(rc==0, "Failed to create logs directory");
        // Clean directory by removing all files
        // SysCmd(tempstr()<<"rm -f " << _db.mcb.logs_dir << "/*");
        prlog("atf_rdk.info"
              << Keyval("comment", "Logs directory initialized")
              << Keyval("logs_dir", _db.mcb.logs_dir)
              );
    }
}

// Initialize mcb counters
void atf_rdk::mcb_init() {
    /// todo as one struct init
    _db.mcb.msg_req_count = 0;
    _db.mcb.msg_ack_count = 0;
    _db.mcb.msg_lat_total = 0;
    _db.mcb.err_ondelivery_count = 0;
    _db.mcb.err_onproduce_count = 0;
    _db.mcb.stop = false;
    _db.mcb.imsg = 0;

    _db.mcb.msg_consume_count =0;
    _db.mcb.msg_consume_lat_total =0;
    _db.mcb.poll_consume_count =0;
}


// Signal handler for graceful shutdown
void atf_rdk::signal_handler(int sig) {
    (void)sig;
    _db.mcb.stop = true;
}
