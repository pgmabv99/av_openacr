#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.FetchRspV15wrk 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.FetchRspV15wrk timeout:10  memcheck:Y  exit_code:0  comment:FetchRspV15wrk
acr.insert  atfdb.targs comptest:kapi.FetchRspV15wrk args:"-decode -hex -pretty -rsp:- -apiver:23.1.15"
acr.insert  atfdb.tmsg  tmsg:kapi.FetchRspV15wrk/100000.in  istuple:N  msg:"00 00 00 be 00 00 00 17 00 00 00 00 00 00 00 5e 9f 33 ab 02 d4 c8 ef 7b 86 84 4a 9f 97 52 6f d1"
acr.insert  atfdb.tmsg  tmsg:kapi.FetchRspV15wrk/100010.in  istuple:N  msg:"7b f1 f7 1d 03 00 00 00 01 00 00 00 00 00 00 00 00 00 01 00 00 00 00 00 00 00 01 00 00 00 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.FetchRspV15wrk/100020.in  istuple:N  msg:"00 00 00 00 ff ff ff ff 52 00 00 00 00 00 00 00 00 00 00 00 45 00 00 00 00 02 70 a5 86 71 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.FetchRspV15wrk/100030.in  istuple:N  msg:"00 00 00 00 00 00 01 97 42 66 8b 39 00 00 01 97 42 66 8b 39 00 00 00 00 00 00 03 e8 00 00 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.FetchRspV15wrk/100040.in  istuple:N  msg:"00 00 00 00 00 01 26 00 00 00 06 6b 65 79 14 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 05 00"
acr.insert  atfdb.tmsg  tmsg:kapi.FetchRspV15wrk/100050.in  istuple:N  msg:"00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ff ff ff ff 01 00"
acr.insert  atfdb.tmsg  tmsg:kapi.FetchRspV15wrk/100060.in  istuple:N  msg:"00 00"
EOF
atf_comp -capture kapi.FetchRspV15wrk
atf_comp -run     kapi.FetchRspV15wrk
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.FetchResponse  request_api_version:15  correlation_id:23  throttle_time_ms:0  error_code:0  session_id:1587491755  responses.0:'kafka2.FetchableTopicResponse1a  topic:""  topic_id:d4c8ef7b-8684-4a9f-9752-6fd17bf1f71d  partitions.0:\'kafka2.PartitionData1a  partition_index:1  error_code:0  high_watermark:1  last_stable_offset:1  log_start_offset:0  preferred_read_replica:-1  records:"00 00 00 00 00 00 00 00 00 00 00 45 00 00 00 00 02 70 a5 86 71 00 00 00 00 00 00 00 00 01 97 42 66 8b 39 00 00 01 97 42 66 8b 39 00 00 00 00 00 00 03 e8 00 00 00 00 00 00 00 00 00 01 26 00 00 00 06 6b 65 79 14 00 00 00 00 00 00 00 00 00 00 00"\'  partitions.1:\'kafka2.PartitionData1a  partition_index:5  error_code:0  high_watermark:0  last_stable_offset:0  log_start_offset:0  preferred_read_replica:-1  records:""\''
# kafka2.FetchResponse
request_api_version:15
correlation_id:23
throttle_time_ms:0
error_code:0
session_id:1587491755
responses.0
  kafka2.FetchableTopicResponse1a
  topic:""
  topic_id:d4c8ef7b-8684-4a9f-9752-6fd17bf1f71d
  partitions.0
    kafka2.PartitionData1a
    partition_index:1
    error_code:0
    high_watermark:1
    last_stable_offset:1
    log_start_offset:0
    preferred_read_replica:-1
    records:"00 00 00 00 00 00 00 00 00 00 00 45 00 00 00 00 02 70 a5 86 71 00 00 00 00 00 00 00 00 01 97 42 66 8b 39 00 00 01 97 42 66 8b 39 00 00 00 00 00 00 03 e8 00 00 00 00 00 00 00 00 00 01 26 00 00 00 06 6b 65 79 14 00 00 00 00 00 00 00 00 00 00 00"
  partitions.1
    kafka2.PartitionData1a
    partition_index:5
    error_code:0
    high_watermark:0
    last_stable_offset:0
    log_start_offset:0
    preferred_read_replica:-1
    records:""

