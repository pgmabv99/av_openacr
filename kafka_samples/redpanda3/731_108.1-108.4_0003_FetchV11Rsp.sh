#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.FetchRspV11rdp 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.FetchRspV11rdp timeout:10  memcheck:Y  exit_code:0  comment:FetchRspV11rdp
acr.insert  atfdb.targs comptest:kapi.FetchRspV11rdp args:"-decode -hex -rsp:- -apiver:3.1.11"
acr.insert  atfdb.tmsg  tmsg:kapi.FetchRspV11rdp/100000.in  istuple:N  msg:"00 00 00 12 00 00 00 03 00 00 00 00 00 00 49 6b 58 91 00 00 00 00 "
EOF
atf_comp -capture kapi.FetchRspV11rdp
atf_comp -run     kapi.FetchRspV11rdp
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.FetchResponse  request_api_version:11  correlation_id:3  throttle_time_ms:0  error_code:0  session_id:1231771793
