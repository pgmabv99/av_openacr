#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.FetchRspV15wrk 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.FetchRspV15wrk timeout:10  memcheck:Y  exit_code:0  comment:FetchRspV15wrk
acr.insert  atfdb.targs comptest:kapi.FetchRspV15wrk args:"-decode -hex -pretty -rsp:- -apiver:26.1.15"
acr.insert  atfdb.tmsg  tmsg:kapi.FetchRspV15wrk/100000.in  istuple:N  msg:"00 00 00 11 00 00 00 1a 00 00 00 00 00 00 00 5e 9f 33 ab 01 00"
EOF
atf_comp -capture kapi.FetchRspV15wrk
atf_comp -run     kapi.FetchRspV15wrk
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.FetchResponse  request_api_version:15  correlation_id:26  throttle_time_ms:0  error_code:0  session_id:1587491755
# kafka2.FetchResponse
request_api_version:15
correlation_id:26
throttle_time_ms:0
error_code:0
session_id:1587491755

