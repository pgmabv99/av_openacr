#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.OffsetFetchReqV8wrk 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.OffsetFetchReqV8wrk timeout:10  memcheck:Y  exit_code:0  comment:OffsetFetchReqV8wrk
acr.insert  atfdb.targs comptest:kapi.OffsetFetchReqV8wrk args:"-decode -hex -pretty -req:-"
acr.insert  atfdb.tmsg  tmsg:kapi.OffsetFetchReqV8wrk/100000.in  istuple:N  msg:"00 00 00 7f 00 09 00 08 00 00 00 0e 00 1a 63 6f 6e 73 75 6d 65 72 2d 73 75 62 2d 30 30 30 2d 75"
acr.insert  atfdb.tmsg  tmsg:kapi.OffsetFetchReqV8wrk/100010.in  istuple:N  msg:"66 4d 4a 49 76 51 2d 31 00 02 10 73 75 62 2d 30 30 30 2d 75 66 4d 4a 49 76 51 02 1b 74 65 73 74"
acr.insert  atfdb.tmsg  tmsg:kapi.OffsetFetchReqV8wrk/100020.in  istuple:N  msg:"2d 74 6f 70 69 63 2d 30 30 30 30 30 30 30 2d 6f 57 70 76 64 51 4d 0b 00 00 00 01 00 00 00 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.OffsetFetchReqV8wrk/100030.in  istuple:N  msg:"00 00 05 00 00 00 04 00 00 00 03 00 00 00 02 00 00 00 09 00 00 00 08 00 00 00 07 00 00 00 06 00"
acr.insert  atfdb.tmsg  tmsg:kapi.OffsetFetchReqV8wrk/100040.in  istuple:N  msg:"00 01 00"
EOF
atf_comp -capture kapi.OffsetFetchReqV8wrk
atf_comp -run     kapi.OffsetFetchReqV8wrk
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.OffsetFetchRequest  request_api_version:8  correlation_id:14  client_id:consumer-sub-000-ufMJIvQ-1  group_id:""  groups.0:'kafka2.OffsetFetchRequestGroup9q  group_id:sub-000-ufMJIvQ  member_epoch:-1  topics.0:"kafka2.OffsetFetchRequestTopics9q  name:test-topic-0000000-oWpvdQM  partition_indexes.0:1  partition_indexes.1:0  partition_indexes.2:5  partition_indexes.3:4  partition_indexes.4:3  partition_indexes.5:2  partition_indexes.6:9  partition_indexes.7:8  partition_indexes.8:7  partition_indexes.9:6"'  require_stable:Y
# kafka2.OffsetFetchRequest
request_api_version:8
correlation_id:14
client_id:consumer-sub-000-ufMJIvQ-1
group_id:""
groups.0
  kafka2.OffsetFetchRequestGroup9q
  group_id:sub-000-ufMJIvQ
  member_epoch:-1
  topics.0
    kafka2.OffsetFetchRequestTopics9q
    name:test-topic-0000000-oWpvdQM
    partition_indexes.0
      1
    partition_indexes.1
      0
    partition_indexes.2
      5
    partition_indexes.3
      4
    partition_indexes.4
      3
    partition_indexes.5
      2
    partition_indexes.6
      9
    partition_indexes.7
      8
    partition_indexes.8
      7
    partition_indexes.9
      6
require_stable:Y

