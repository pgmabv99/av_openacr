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
set -e
acr_ed -del    -ctype atf_rdk.FMcb                            -write  || true
acr_ed -create -ctype atf_rdk.FMcb                            -write -comment "Main CB"
acr_ed -create -field atf_rdk.FMcb.msg_req_count              -arg u64               -write -comment "count of produce enqueued messages"
acr_ed -create -field atf_rdk.FMcb.msg_ack_count              -arg u64               -write -comment "count of produce acked  messages"
acr_ed -create -field atf_rdk.FMcb.msg_lat_total              -arg u64               -write -comment "total latency of produce acked messages"
acr_ed -create -field atf_rdk.FMcb.stop                       -arg bool              -write -comment "stop  flag for producer"
acr_ed -create -field atf_rdk.FMcb.rk                  -arg u8       -reftype Ptr -write -comment " rd_kafka_t pointer"
acr_ed -create -field atf_rdk.FMcb.rkt                 -arg u8       -reftype Ptr -write -comment " rd_kafka_topic_t pointer"

# acr_ed -create -field atf_rdk.FMcb.rk               -arg atf_rdk.rd_kafka_t       -reftype Ptr -write -comment ""
# acr_ed -create -field atf_rdk.FMcb.rkt              -arg atf_rdk.rd_kafka_topic_t -reftype Ptr -write -comment ""



# include  atf_rdk.FMcb into _db
acr_ed -del    -field atf_rdk.FDb.mcb                          -write
acr_ed -create -field atf_rdk.FDb.mcb                          -arg atf_rdk.FMcb        -write -comment ""
# -------------------


#  set parms for atf_rdk
acr -merge  -write <<EOF
acr.delete dmmeta.field  field:command.atf_rdk.broker
acr.delete dmmeta.field  field:command.atf_rdk.topic
acr.delete dmmeta.field  field:command.atf_rdk.max_msg 
EOF
acr -merge -write <<EOF
    dmmeta.field  field:command.atf_rdk.broker              arg:algo.cstring  reftype:Val      dflt:'"nj1-4.kafka-1.ext-0:1643"'  comment:"broker url"
    dmmeta.field  field:command.atf_rdk.topic               arg:algo.cstring  reftype:Val      dflt:'"rdk_test"'  comment:"topic to use"
    dmmeta.field  field:command.atf_rdk.max_msg             arg:u64           reftype:Val      dflt:5             comment:"number of messages to produce"
EOF


amc
amc_vis atf_rdk.%   > ~/av_openacr/atf_snf_viz.txt

# ai

echo "done!!!!!!!!!!!!"
