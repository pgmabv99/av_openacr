#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.FindCoordinatorRspV4wrk 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.FindCoordinatorRspV4wrk timeout:10  memcheck:Y  exit_code:0  comment:FindCoordinatorRspV4wrk
acr.insert  atfdb.targs comptest:kapi.FindCoordinatorRspV4wrk args:"-decode -hex -pretty -rsp:- -apiver:0.10.4"
acr.insert  atfdb.tmsg  tmsg:kapi.FindCoordinatorRspV4wrk/100000.in  istuple:N  msg:"00 00 00 28 00 00 00 00 00 00 00 00 00 02 10 73 75 62 2d 30 30 30 2d 75 66 4d 4a 49 76 51 ff ff"
acr.insert  atfdb.tmsg  tmsg:kapi.FindCoordinatorRspV4wrk/100010.in  istuple:N  msg:"ff ff 01 ff ff ff ff 00 0f 01 00 00"
EOF
atf_comp -capture kapi.FindCoordinatorRspV4wrk
atf_comp -run     kapi.FindCoordinatorRspV4wrk
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.FindCoordinatorResponse  request_api_version:4  correlation_id:0  throttle_time_ms:0  error_code:0  node_id:0  host:""  port:0  coordinators.0:'kafka2.Coordinator10a  key:sub-000-ufMJIvQ  node_id:-1  host:""  port:-1  error_code:15  error_message:""'
# kafka2.FindCoordinatorResponse
request_api_version:4
correlation_id:0
throttle_time_ms:0
error_code:0
node_id:0
host:""
port:0
coordinators.0
  kafka2.Coordinator10a
  key:sub-000-ufMJIvQ
  node_id:-1
  host:""
  port:-1
  error_code:15
  error_message:""

