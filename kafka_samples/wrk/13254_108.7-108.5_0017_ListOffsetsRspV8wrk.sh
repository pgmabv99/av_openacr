#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.ListOffsetsRspV8wrk 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.ListOffsetsRspV8wrk timeout:10  memcheck:Y  exit_code:0  comment:ListOffsetsRspV8wrk
acr.insert  atfdb.targs comptest:kapi.ListOffsetsRspV8wrk args:"-decode -hex -pretty -rsp:- -apiver:17.2.8"
acr.insert  atfdb.tmsg  tmsg:kapi.ListOffsetsRspV8wrk/100000.in  istuple:N  msg:"00 00 00 5e 00 00 00 11 00 00 00 00 00 02 1b 74 65 73 74 2d 74 6f 70 69 63 2d 30 30 30 30 30 30"
acr.insert  atfdb.tmsg  tmsg:kapi.ListOffsetsRspV8wrk/100010.in  istuple:N  msg:"30 2d 6f 57 70 76 64 51 4d 03 00 00 00 01 00 00 ff ff ff ff ff ff ff ff 00 00 00 00 00 00 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.ListOffsetsRspV8wrk/100020.in  istuple:N  msg:"00 00 00 00 00 00 00 00 05 00 00 ff ff ff ff ff ff ff ff 00 00 00 00 00 00 00 00 00 00 00 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.ListOffsetsRspV8wrk/100030.in  istuple:N  msg:"00 00"
EOF
atf_comp -capture kapi.ListOffsetsRspV8wrk
atf_comp -run     kapi.ListOffsetsRspV8wrk
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.ListOffsetsResponse  request_api_version:8  correlation_id:17  throttle_time_ms:0  topics.0:'kafka2.ListOffsetsTopicResponse2a  name:test-topic-0000000-oWpvdQM  partitions.0:"kafka2.ListOffsetsPartitionResponse2a  partition_index:1  error_code:0  timestamp:-1  offset:0  leader_epoch:0"  partitions.1:"kafka2.ListOffsetsPartitionResponse2a  partition_index:5  error_code:0  timestamp:-1  offset:0  leader_epoch:0"'
# kafka2.ListOffsetsResponse
request_api_version:8
correlation_id:17
throttle_time_ms:0
topics.0
  kafka2.ListOffsetsTopicResponse2a
  name:test-topic-0000000-oWpvdQM
  partitions.0
    kafka2.ListOffsetsPartitionResponse2a
    partition_index:1
    error_code:0
    timestamp:-1
    offset:0
    leader_epoch:0
  partitions.1
    kafka2.ListOffsetsPartitionResponse2a
    partition_index:5
    error_code:0
    timestamp:-1
    offset:0
    leader_epoch:0

