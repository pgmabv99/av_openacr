#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.OffsetCommitRspV8wrk 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.OffsetCommitRspV8wrk timeout:10  memcheck:Y  exit_code:0  comment:OffsetCommitRspV8wrk
acr.insert  atfdb.targs comptest:kapi.OffsetCommitRspV8wrk args:"-decode -hex -pretty -rsp:- -apiver:27.8.8"
acr.insert  atfdb.tmsg  tmsg:kapi.OffsetCommitRspV8wrk/100000.in  istuple:N  msg:"00 00 00 2f 00 00 00 1b 00 00 00 00 00 02 1b 74 65 73 74 2d 74 6f 70 69 63 2d 30 30 30 30 30 30"
acr.insert  atfdb.tmsg  tmsg:kapi.OffsetCommitRspV8wrk/100010.in  istuple:N  msg:"30 2d 6f 57 70 76 64 51 4d 02 00 00 00 01 00 00 00 00 00"
EOF
atf_comp -capture kapi.OffsetCommitRspV8wrk
atf_comp -run     kapi.OffsetCommitRspV8wrk
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.OffsetCommitResponse  request_api_version:8  correlation_id:27  throttle_time_ms:0  topics.0:'kafka2.OffsetCommitResponseTopic8a  name:test-topic-0000000-oWpvdQM  partitions.0:"kafka2.OffsetCommitResponsePartition8a  partition_index:1  error_code:0"'
# kafka2.OffsetCommitResponse
request_api_version:8
correlation_id:27
throttle_time_ms:0
topics.0
  kafka2.OffsetCommitResponseTopic8a
  name:test-topic-0000000-oWpvdQM
  partitions.0
    kafka2.OffsetCommitResponsePartition8a
    partition_index:1
    error_code:0

