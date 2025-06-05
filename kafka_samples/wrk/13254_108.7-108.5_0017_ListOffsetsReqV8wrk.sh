#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.ListOffsetsReqV8wrk 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.ListOffsetsReqV8wrk timeout:10  memcheck:Y  exit_code:0  comment:ListOffsetsReqV8wrk
acr.insert  atfdb.targs comptest:kapi.ListOffsetsReqV8wrk args:"-decode -hex -pretty -req:-"
acr.insert  atfdb.tmsg  tmsg:kapi.ListOffsetsReqV8wrk/100000.in  istuple:N  msg:"00 00 00 6b 00 02 00 08 00 00 00 11 00 1a 63 6f 6e 73 75 6d 65 72 2d 73 75 62 2d 30 30 30 2d 75"
acr.insert  atfdb.tmsg  tmsg:kapi.ListOffsetsReqV8wrk/100010.in  istuple:N  msg:"66 4d 4a 49 76 51 2d 31 00 ff ff ff ff 00 02 1b 74 65 73 74 2d 74 6f 70 69 63 2d 30 30 30 30 30"
acr.insert  atfdb.tmsg  tmsg:kapi.ListOffsetsReqV8wrk/100020.in  istuple:N  msg:"30 30 2d 6f 57 70 76 64 51 4d 03 00 00 00 01 00 00 00 00 ff ff ff ff ff ff ff fe 00 00 00 00 05"
acr.insert  atfdb.tmsg  tmsg:kapi.ListOffsetsReqV8wrk/100030.in  istuple:N  msg:"00 00 00 00 ff ff ff ff ff ff ff fe 00 00 00"
EOF
atf_comp -capture kapi.ListOffsetsReqV8wrk
atf_comp -run     kapi.ListOffsetsReqV8wrk
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.ListOffsetsRequest  request_api_version:8  correlation_id:17  client_id:consumer-sub-000-ufMJIvQ-1  replica_id:-1  isolation_level:0  topics.0:'kafka2.ListOffsetsTopic2q  name:test-topic-0000000-oWpvdQM  partitions.0:"kafka2.ListOffsetsPartition2q  partition_index:1  current_leader_epoch:0  timestamp:-2"  partitions.1:"kafka2.ListOffsetsPartition2q  partition_index:5  current_leader_epoch:0  timestamp:-2"'  timeout_ms:0
# kafka2.ListOffsetsRequest
request_api_version:8
correlation_id:17
client_id:consumer-sub-000-ufMJIvQ-1
replica_id:-1
isolation_level:0
topics.0
  kafka2.ListOffsetsTopic2q
  name:test-topic-0000000-oWpvdQM
  partitions.0
    kafka2.ListOffsetsPartition2q
    partition_index:1
    current_leader_epoch:0
    timestamp:-2
  partitions.1
    kafka2.ListOffsetsPartition2q
    partition_index:5
    current_leader_epoch:0
    timestamp:-2
timeout_ms:0

