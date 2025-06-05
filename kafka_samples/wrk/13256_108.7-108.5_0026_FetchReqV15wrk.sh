#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.FetchReqV15wrk 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.FetchReqV15wrk timeout:10  memcheck:Y  exit_code:0  comment:FetchReqV15wrk
acr.insert  atfdb.targs comptest:kapi.FetchReqV15wrk args:"-decode -hex -pretty -req:-"
acr.insert  atfdb.tmsg  tmsg:kapi.FetchReqV15wrk/100000.in  istuple:N  msg:"00 00 00 71 00 01 00 0f 00 00 00 1a 00 1a 63 6f 6e 73 75 6d 65 72 2d 73 75 62 2d 30 30 30 2d 75"
acr.insert  atfdb.tmsg  tmsg:kapi.FetchReqV15wrk/100010.in  istuple:N  msg:"66 4d 4a 49 76 51 2d 31 00 00 00 01 f4 00 00 00 01 03 20 00 00 00 5e 9f 33 ab 00 00 00 01 02 d4"
acr.insert  atfdb.tmsg  tmsg:kapi.FetchReqV15wrk/100020.in  istuple:N  msg:"c8 ef 7b 86 84 4a 9f 97 52 6f d1 7b f1 f7 1d 02 00 00 00 01 00 00 00 00 00 00 00 00 00 00 00 01"
acr.insert  atfdb.tmsg  tmsg:kapi.FetchReqV15wrk/100030.in  istuple:N  msg:"ff ff ff ff ff ff ff ff ff ff ff ff 00 a0 00 00 00 00 01 01 00"
EOF
atf_comp -capture kapi.FetchReqV15wrk
atf_comp -run     kapi.FetchReqV15wrk
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.FetchRequest  request_api_version:15  correlation_id:26  client_id:consumer-sub-000-ufMJIvQ-1  replica_id:-1  max_wait_ms:500  min_bytes:1  max_bytes:52428800  isolation_level:0  session_id:1587491755  session_epoch:1  topics.0:'kafka2.FetchTopic1q  topic:""  topic_id:d4c8ef7b-8684-4a9f-9752-6fd17bf1f71d  partitions.0:"kafka2.FetchPartition1q  partition:1  current_leader_epoch:0  fetch_offset:1  last_fetched_epoch:-1  log_start_offset:-1  partition_max_bytes:10485760"'  rack_id:""
# kafka2.FetchRequest
request_api_version:15
correlation_id:26
client_id:consumer-sub-000-ufMJIvQ-1
replica_id:-1
max_wait_ms:500
min_bytes:1
max_bytes:52428800
isolation_level:0
session_id:1587491755
session_epoch:1
topics.0
  kafka2.FetchTopic1q
  topic:""
  topic_id:d4c8ef7b-8684-4a9f-9752-6fd17bf1f71d
  partitions.0
    kafka2.FetchPartition1q
    partition:1
    current_leader_epoch:0
    fetch_offset:1
    last_fetched_epoch:-1
    log_start_offset:-1
    partition_max_bytes:10485760
rack_id:""

