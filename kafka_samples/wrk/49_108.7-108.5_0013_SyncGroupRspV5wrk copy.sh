#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.SyncGroupRspV5wrk 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.SyncGroupRspV5wrk timeout:10  memcheck:Y  exit_code:0  comment:SyncGroupRspV5wrk
acr.insert  atfdb.targs comptest:kapi.SyncGroupRspV5wrk args:"-decode -hex -pretty -rsp:- -apiver:13.14.5"
acr.insert  atfdb.tmsg  tmsg:kapi.SyncGroupRspV5wrk/100000.in  istuple:N  msg:"00 00 00 6e 00 00 00 0d 00 00 00 00 00 00 00 09 63 6f 6e 73 75 6d 65 72 06 72 61 6e 67 65 53 00"
acr.insert  atfdb.tmsg  tmsg:kapi.SyncGroupRspV5wrk/100010.in  istuple:N  msg:"03 00 00 00 01 00 1a 74 65 73 74 2d 74 6f 70 69 63 2d 30 30 30 30 30 30 30 2d 6f 57 70 76 64 51"
acr.insert  atfdb.tmsg  tmsg:kapi.SyncGroupRspV5wrk/100020.in  istuple:N  msg:"4d 00 00 00 0a 00 00 00 00 00 00 00 01 00 00 00 02 00 00 00 03 00 00 00 04 00 00 00 05 00 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.SyncGroupRspV5wrk/100030.in  istuple:N  msg:"06 00 00 00 07 00 00 00 08 00 00 00 09 ff ff ff ff 00"
EOF
atf_comp -capture kapi.SyncGroupRspV5wrk
atf_comp -run     kapi.SyncGroupRspV5wrk
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.SyncGroupResponse  request_api_version:5  correlation_id:13  throttle_time_ms:0  error_code:0  protocol_type:consumer  protocol_name:range  assignment:"00 03 00 00 00 01 00 1a 74 65 73 74 2d 74 6f 70 69 63 2d 30 30 30 30 30 30 30 2d 6f 57 70 76 64 51 4d 00 00 00 0a 00 00 00 00 00 00 00 01 00 00 00 02 00 00 00 03 00 00 00 04 00 00 00 05 00 00 00 06 00 00 00 07 00 00 00 08 00 00 00 09 ff ff ff ff"
# kafka2.SyncGroupResponse
request_api_version:5
correlation_id:13
throttle_time_ms:0
error_code:0
protocol_type:consumer
protocol_name:range
assignment:"00 03 00 00 00 01 00 1a 74 65 73 74 2d 74 6f 70 69 63 2d 30 30 30 30 30 30 30 2d 6f 57 70 76 64 51 4d 00 00 00 0a 00 00 00 00 00 00 00 01 00 00 00 02 00 00 00 03 00 00 00 04 00 00 00 05 00 00 00 06 00 00 00 07 00 00 00 08 00 00 00 09 ff ff ff ff"

