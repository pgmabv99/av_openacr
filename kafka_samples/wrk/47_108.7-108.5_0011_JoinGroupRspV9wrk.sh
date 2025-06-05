#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.JoinGroupRspV9wrk 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.JoinGroupRspV9wrk timeout:10  memcheck:Y  exit_code:0  comment:JoinGroupRspV9wrk
acr.insert  atfdb.targs comptest:kapi.JoinGroupRspV9wrk args:"-decode -hex -pretty -rsp:- -apiver:11.11.9"
acr.insert  atfdb.tmsg  tmsg:kapi.JoinGroupRspV9wrk/100000.in  istuple:N  msg:"00 00 00 55 00 00 00 0b 00 00 00 00 00 00 4f ff ff ff ff 00 00 01 00 40 63 6f 6e 73 75 6d 65 72"
acr.insert  atfdb.tmsg  tmsg:kapi.JoinGroupRspV9wrk/100010.in  istuple:N  msg:"2d 73 75 62 2d 30 30 30 2d 75 66 4d 4a 49 76 51 2d 31 2d 39 66 33 32 62 34 39 66 2d 61 62 39 64"
acr.insert  atfdb.tmsg  tmsg:kapi.JoinGroupRspV9wrk/100020.in  istuple:N  msg:"2d 34 39 61 64 2d 39 35 35 39 2d 38 36 33 65 31 35 61 62 37 32 36 30 01 00"
EOF
atf_comp -capture kapi.JoinGroupRspV9wrk
atf_comp -run     kapi.JoinGroupRspV9wrk
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.JoinGroupResponse  request_api_version:9  correlation_id:11  throttle_time_ms:0  error_code:79  generation_id:-1  leader:""  skip_assignment:N  member_id:consumer-sub-000-ufMJIvQ-1-9f32b49f-ab9d-49ad-9559-863e15ab7260
# kafka2.JoinGroupResponse
request_api_version:9
correlation_id:11
throttle_time_ms:0
error_code:79
generation_id:-1
leader:""
skip_assignment:N
member_id:consumer-sub-000-ufMJIvQ-1-9f32b49f-ab9d-49ad-9559-863e15ab7260

