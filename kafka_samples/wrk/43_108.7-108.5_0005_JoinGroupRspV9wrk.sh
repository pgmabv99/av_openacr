#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.JoinGroupRspV9wrk 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.JoinGroupRspV9wrk timeout:10  memcheck:Y  exit_code:0  comment:JoinGroupRspV9wrk
acr.insert  atfdb.targs comptest:kapi.JoinGroupRspV9wrk args:"-decode -hex -pretty -rsp:- -apiver:5.11.9"
acr.insert  atfdb.tmsg  tmsg:kapi.JoinGroupRspV9wrk/100000.in  istuple:N  msg:"00 00 00 16 00 00 00 05 00 00 00 00 00 00 10 ff ff ff ff 00 00 01 00 01 01 00"
EOF
atf_comp -capture kapi.JoinGroupRspV9wrk
atf_comp -run     kapi.JoinGroupRspV9wrk
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.JoinGroupResponse  request_api_version:9  correlation_id:5  throttle_time_ms:0  error_code:16  generation_id:-1  leader:""  skip_assignment:N  member_id:""
# kafka2.JoinGroupResponse
request_api_version:9
correlation_id:5
throttle_time_ms:0
error_code:16
generation_id:-1
leader:""
skip_assignment:N
member_id:""

