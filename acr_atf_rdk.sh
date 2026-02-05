#!/bin/bash
set -x
set -e


#  by hand
# dev.targdep  targdep:atf_rdk.lib_kafka  comment:""
#     dev.targdep  targdep:atf_rdk.kafka2  comment:""


init=false
# one time only !!!!!!!!!!!!!!!!!!
if [ "$init" = "true" ]; then
  acr_ed -del -target:atf_rdk -write || true
  acr_ed -create -target:atf_rdk -write -comment "atf_rdk target"
  acr_ed -create -srcfile cpp/atf_rdk/atf_rdk.cpp -write -comment "rdkafka testing tool"
  acr_ed -create -srcfile cpp/atf_rdk/consume.cpp -write -comment "rdkafka consume  tool"
  acr_ed -create -srcfile cpp/atf_rdk/produce.cpp -write -comment "rdkafka produce  tool"
  acr_compl -install
fi


# types for external pointers



# acr_ed -del    -ctype atf_rdk.rd_kafka_t                     -write  || true
# acr_ed -create -ctype atf_rdk.rd_kafka_t                     -write -comment "rd_kafka_ttype (external)"
# acr_ed -del    -ctype atf_rdk.rd_kafka_topic_t               -write  || true
# acr_ed -create -ctype atf_rdk.rd_kafka_topic_t               -write -comment "rd_kafka_topic_ttype (external)"

# #  set parms for atf_rdk
# acr -merge  -write <<EOF
# acr.delete dmmeta.fwddecl  fwddecl:atf_rdk.rd_kafka_t
# acr.delete dmmeta.fwddecl  fwddecl:atf_rdk.rd_kafka_topic_s
# acr_delete dmmeta.cextern  ctype:rd_kafka_s
# acr_delete dmmeta.cextern  ctype:rd_kafka_topic_s
# EOF

# acr -merge -write <<EOF
# dmmeta.fwddecl  fwddecl:atf_rdk.rd_kafka_t         comment:""
# dmmeta.fwddecl  fwddecl:atf_rdk.rd_kafka_topic_t         comment:""
# dmmeta.cextern  ctype:atf_rdk.rd_kafka_t  initmemset:N  isstruct:Y  plaindata:N
# dmmeta.cextern  ctype:atf_rdk.rd_kafka_topic_t  initmemset:N  isstruct:Y  plaindata:N
# EOF

#-------------main CB

# -------------rdkafka wrk object

acr_ed -del  -ctype atf_rdk.FWrk      -write || true
acr_ed -create -ctype atf_rdk.FWrk                   -pooltype Tpool       -write  -comment "worjker  object"
acr_ed -create -field atf_rdk.FWrk.wrk                   -arg algo.Smallstr50               -write -comment "wrk id"
acr_ed -create -field atf_rdk.FWrk.pid                   -arg i32                -write -comment "process id"

# pointers from above
acr_ed -del    -field atf_rdk.FDb.zd_wrk         -write || true
acr_ed -del    -field atf_rdk.FDb.ind_wrk         -write || true
acr_ed -create -field atf_rdk.FDb.zd_wrk            -cascdel              -write -comment ""
acr_ed -create -field atf_rdk.FDb.ind_wrk           -cascdel              -write -comment ""

#-------------rdkafka topic object

acr_ed -del  -ctype atf_rdk.FTopic      -write || true
acr_ed -create -ctype atf_rdk.FTopic                     -pooltype Tpool       -write  -comment "topic object"
acr_ed -create -field atf_rdk.FTopic.topic               -arg algo.Smallstr50               -write -comment "topic name"
acr_ed -create -field atf_rdk.FTopic.rkt                 -arg u8       -reftype Ptr -write -comment " rd_kafka_topic_t pointer"

# pointers from above
acr_ed -del    -field atf_rdk.FDb.zd_topic       -write || true
acr_ed -del    -field atf_rdk.FDb.ind_topic         -write || true
acr_ed -create -field atf_rdk.FDb.zd_topic            -cascdel              -write -comment ""
acr_ed -create -field atf_rdk.FDb.ind_topic           -cascdel              -write -comment ""

set -e
acr_ed -del    -ctype atf_rdk.FMcb                               -write  || true
acr_ed -create -ctype atf_rdk.FMcb                               -write -comment "Main CB"
acr_ed -create -field atf_rdk.FMcb.msg_buf                       -arg algo.ByteAry      -write -comment "msg buffer"
acr_ed -create -field atf_rdk.FMcb.msg_req_count                 -arg u64               -write -comment "count of produce enqueued messages"
acr_ed -create -field atf_rdk.FMcb.msg_ack_count                 -arg u64               -write -comment "count of produce acked  messages"
acr_ed -create -field atf_rdk.FMcb.msg_ack_count_last            -arg u64               -write -comment "count of produce acked  messages, last  monitor check"
acr_ed -create -field atf_rdk.FMcb.msg_lat_total                 -arg u64               -write -comment "total latency of produce acked messages"
acr_ed -create -field atf_rdk.FMcb.msg_lat_total_last            -arg u64               -write -comment "total latency of produce acked messages, last check"
acr_ed -create -field atf_rdk.FMcb.max_msg_all_topics            -arg u64               -write -comment "max messages to produce across all topics"
acr_ed -create -field atf_rdk.FMcb.imsg                          -arg u64               -write -comment "index of current mproduced message"
acr_ed -create -field atf_rdk.FMcb.err_ondelivery_count          -arg u64               -write -comment "error count on delivery"
acr_ed -create -field atf_rdk.FMcb.err_onproduce_count           -arg u64               -write -comment "error count on produce"
acr_ed -create -field atf_rdk.FMcb.itopic_10p                    -arg u64               -write -comment "count of 10% topics"
acr_ed -create -field atf_rdk.FMcb.stop                          -arg bool              -write -comment "stop  flag for producer"
acr_ed -create -field atf_rdk.FMcb.time0                         -arg algo.SchedTime    -write -comment "starting time for each session"
acr_ed -create -field atf_rdk.FMcb.sleep_us                     -arg u64               -write -comment "sleep us between messages"
acr_ed -create -field atf_rdk.FMcb.logs_dir                    -arg algo.Smallstr50              -write -comment "subfolder for rdk logs"
acr_ed -create -field atf_rdk.FMcb.rd_stats_json                 -arg algo.cstring             -write -comment "save json from rd_stat callback"
acr_ed -create -field atf_rdk.FMcb.rd_stats_file                -arg algo.Smallstr50            -write -comment "file name for rd_stats json"
# consume stats
acr_ed -create -field atf_rdk.FMcb.msg_consume_count           -arg u64           -write -comment "count of consumed messages"
acr_ed -create -field atf_rdk.FMcb.msg_consume_count_last      -arg u64           -write -comment "count of poll calls for consume, last monitor check"
acr_ed -create -field atf_rdk.FMcb.poll_consume_count          -arg u64           -write -comment "count of poll calls for consume, last monitor check"
acr_ed -create -field atf_rdk.FMcb.msg_consume_lat_total       -arg u64           -write -comment "total latency of produce acked messages"
acr_ed -create -field atf_rdk.FMcb.msg_consume_lat_total_last  -arg u64           -write -comment "total latency of produce acked messages, last monitor check"

# pointers to rdkafka objects
acr_ed -create -field atf_rdk.FMcb.rk                            -arg u8                -reftype Ptr -write -comment " rd_kafka_t pointer"
acr_ed -create -field atf_rdk.FMcb.rkt                           -arg u8                -reftype Ptr -write -comment " rd_kafka_topic_t pointer(produce)"
acr_ed -create -field atf_rdk.FMcb.topic_list                    -arg u8                -reftype Ptr -write -comment " rd_kafka_topic_partition_list_t pointer(consume)"

# include  atf_rdk.FMcb into _db
acr_ed -del    -field atf_rdk.FDb.mcb                          -write
acr_ed -create -field atf_rdk.FDb.mcb                          -arg atf_rdk.FMcb        -write -comment ""
# -------------------


#  set parms for atf_rdk
acr -merge  -write <<EOF
acr.delete dmmeta.field  field:command.atf_rdk.broker
acr.delete dmmeta.field  field:command.atf_rdk.topic
acr.delete dmmeta.field  field:command.atf_rdk.max_msgs
acr.delete dmmeta.field  field:command.atf_rdk.max_topics 
acr.delete dmmeta.field  field:command.atf_rdk.msg_rate 
acr.delete dmmeta.field  field:command.atf_rdk.msg_max_size 
acr.delete dmmeta.field  field:command.atf_rdk.progress
acr.delete dmmeta.field  field:command.atf_rdk.rd_stats
acr.delete dmmeta.field  field:command.atf_rdk.run_id
acr.delete dmmeta.field  field:command.atf_rdk.use_stdin
acr.delete dmmeta.field  field:command.atf_rdk.n_c
acr.delete dmmeta.field  field:command.atf_rdk.n_p
acr.delete dmmeta.field  field:command.atf_rdk.msg_consume_poll_rate
acr.delete dmmeta.field  field:command.atf_rdk.test
EOF
acr -merge -write <<EOF
    dmmeta.field  field:command.atf_rdk.broker       arg:algo.cstring  reftype:Val  dflt:'"localhost:54005"'  comment:"broker url"
    dmmeta.field  field:command.atf_rdk.topic        arg:algo.cstring  reftype:Val  dflt:'"test-topic"'               comment:"topic name prefix"
    dmmeta.field  field:command.atf_rdk.max_msgs     arg:u64           reftype:Val  dflt:10                          comment:"number of messages to produce"
    dmmeta.field  field:command.atf_rdk.max_topics   arg:u64           reftype:Val  dflt:10                          comment:"number of topics to produce"
    dmmeta.field  field:command.atf_rdk.msg_rate     arg:u64           reftype:Val  dflt:1000000                     comment:"message rate per sec"
    dmmeta.field  field:command.atf_rdk.msg_max_size arg:u64           reftype:Val  dflt:10                          comment:"maximum message size"
    dmmeta.field  field:command.atf_rdk.progress     arg:bool          reftype:Val  dflt:true                        comment:"print progress report"
    dmmeta.field  field:command.atf_rdk.rd_stats     arg:bool          reftype:Val  dflt:false                       comment:"save  rdkafka stats in json file"
    dmmeta.field  field:command.atf_rdk.use_stdin    arg:bool          reftype:Val  dflt:false                       comment:"use stdin for message input.  If false, generate messages"
    dmmeta.field  field:command.atf_rdk.run_id       arg:algo.cstring  reftype:Val  dflt:'""'                    comment:"run id for parallel runs"
    dmmeta.field  field:command.atf_rdk.n_c           arg:u64          reftype:Val  dflt:0                            comment:"number of consumer runners (0=disable consume)"
    dmmeta.field  field:command.atf_rdk.n_p           arg:u64          reftype:Val  dflt:0                            comment:"number of producer runners (0=disable produce)"

    dmmeta.field  field:command.atf_rdk.msg_consume_poll_rate     arg:u64           reftype:Val  dflt:1000                         comment:"poll rate for consume loop per sec"
    
    dmmeta.field  field:command.atf_rdk.test       arg:algo.cstring  reftype:Val  dflt:'""'                           comment:"test to run. overrides other command line parms, for testing purposes"
    
EOF



#----------FDb  steps/hooks

# monitor step
acr_ed -del    -field atf_rdk.FDb.rdk_mon                     -write || true
acr_ed -create -field atf_rdk.FDb.rdk_mon                     -arg bool             -write -comment "step field for rdk monitoring loop"
acr -merge -write <<EOF
    dmmeta.fstep  fstep:atf_rdk.FDb.rdk_mon steptype:InlineRecur comment:"monitor"
    dmmeta.fdelay  fstep:atf_rdk.FDb.rdk_mon   delay:1.000000000  scale:N  comment:""
EOF

# time hook for produce message
acr_ed -del    -field atf_rdk.FDb.th_msg                         -write || true
acr_ed -create -field atf_rdk.FDb.th_msg                          -arg algo_lib.FTimehook  -reftype Val      -write -comment ""

# terminal input hook for produce message
acr_ed -del    -field atf_rdk.FDb.terminal                        -write || true
acr_ed -create -field atf_rdk.FDb.terminal -arg algo_lib.FIohook -write -comment "terminal input hook/ fd"

# consume polling step
acr_ed -del    -field atf_rdk.FDb.rdk_consume_poll                     -write || true
acr_ed -create -field atf_rdk.FDb.rdk_consume_poll                     -arg bool             -write -comment "step field for consume polling loop"
acr -merge -write <<EOF
    dmmeta.fstep  fstep:atf_rdk.FDb.rdk_consume_poll steptype:Inline  comment:"should be without delay"
EOF

# ------------
amc
amc_vis atf_rdk.%   > ~/av_openacr/atf_rdk_viz.txt

# ai

echo "done!!!!!!!!!!!!"
