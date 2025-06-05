#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.ProduceRspV9wrk 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.ProduceRspV9wrk timeout:10  memcheck:Y  exit_code:0  comment:ProduceRspV9wrk
acr.insert  atfdb.targs comptest:kapi.ProduceRspV9wrk args:"-decode -hex -pretty -rsp:- -apiver:70.0.9"
acr.insert  atfdb.tmsg  tmsg:kapi.ProduceRspV9wrk/100000.in  istuple:N  msg:"00 00 00 49 00 00 00 46 00 02 1b 74 65 73 74 2d 74 6f 70 69 63 2d 30 30 30 30 30 30 30 2d 6f 57"
acr.insert  atfdb.tmsg  tmsg:kapi.ProduceRspV9wrk/100010.in  istuple:N  msg:"70 76 64 51 4d 02 00 00 00 05 00 00 00 00 00 00 00 00 00 00 ff ff ff ff ff ff ff ff 00 00 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.ProduceRspV9wrk/100020.in  istuple:N  msg:"00 00 00 00 01 00 00 00 00 00 00 00 00"
EOF
atf_comp -capture kapi.ProduceRspV9wrk
atf_comp -run     kapi.ProduceRspV9wrk
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.ProduceResponse  request_api_version:9  correlation_id:70  responses.0:'kafka2.TopicProduceResponse0a  name:test-topic-0000000-oWpvdQM  partition_responses.0:"kafka2.PartitionProduceResponse0a  index:5  error_code:0  base_offset:0  log_append_time_ms:-1  log_start_offset:0"'  throttle_time_ms:0
# kafka2.ProduceResponse
request_api_version:9
correlation_id:70
responses.0
  kafka2.TopicProduceResponse0a
  name:test-topic-0000000-oWpvdQM
  partition_responses.0
    kafka2.PartitionProduceResponse0a
    index:5
    error_code:0
    base_offset:0
    log_append_time_ms:-1
    log_start_offset:0
throttle_time_ms:0

