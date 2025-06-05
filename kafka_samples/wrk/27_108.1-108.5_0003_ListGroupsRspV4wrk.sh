#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.ListGroupsRspV4wrk 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.ListGroupsRspV4wrk timeout:10  memcheck:Y  exit_code:0  comment:ListGroupsRspV4wrk
acr.insert  atfdb.targs comptest:kapi.ListGroupsRspV4wrk args:"-decode -hex -pretty -rsp:- -apiver:3.16.4"
acr.insert  atfdb.tmsg  tmsg:kapi.ListGroupsRspV4wrk/100000.in  istuple:N  msg:"00 00 00 0d 00 00 00 03 00 00 00 00 00 00 00 01 00"
EOF
atf_comp -capture kapi.ListGroupsRspV4wrk
atf_comp -run     kapi.ListGroupsRspV4wrk
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.ListGroupsResponse  request_api_version:4  correlation_id:3  throttle_time_ms:0  error_code:0
# kafka2.ListGroupsResponse
request_api_version:4
correlation_id:3
throttle_time_ms:0
error_code:0

