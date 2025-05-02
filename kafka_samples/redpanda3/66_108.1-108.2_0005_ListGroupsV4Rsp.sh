#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.ListGroupsRspV4rdp 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.ListGroupsRspV4rdp timeout:10  memcheck:Y  exit_code:0  comment:ListGroupsRspV4rdp
acr.insert  atfdb.targs comptest:kapi.ListGroupsRspV4rdp args:"-decode -hex -rsp:- -apiver:5.16.4"
acr.insert  atfdb.tmsg  tmsg:kapi.ListGroupsRspV4rdp/100000.in  istuple:N  msg:"00 00 00 0d 00 00 00 05 00 00 00 00 00 00 00 01 00 "
EOF
atf_comp -capture kapi.ListGroupsRspV4rdp
atf_comp -run     kapi.ListGroupsRspV4rdp
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.ListGroupsResponse  request_api_version:4  correlation_id:5  throttle_time_ms:0  error_code:0
