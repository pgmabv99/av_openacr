#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.FindCoordinatorReqV4wrk 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.FindCoordinatorReqV4wrk timeout:10  memcheck:Y  exit_code:0  comment:FindCoordinatorReqV4wrk
acr.insert  atfdb.targs comptest:kapi.FindCoordinatorReqV4wrk args:"-decode -hex -pretty -req:-"
acr.insert  atfdb.tmsg  tmsg:kapi.FindCoordinatorReqV4wrk/100000.in  istuple:N  msg:"00 00 00 38 00 0a 00 04 00 00 00 00 00 1a 63 6f 6e 73 75 6d 65 72 2d 73 75 62 2d 30 30 30 2d 75"
acr.insert  atfdb.tmsg  tmsg:kapi.FindCoordinatorReqV4wrk/100010.in  istuple:N  msg:"66 4d 4a 49 76 51 2d 31 00 00 02 10 73 75 62 2d 30 30 30 2d 75 66 4d 4a 49 76 51 00"
EOF
atf_comp -capture kapi.FindCoordinatorReqV4wrk
atf_comp -run     kapi.FindCoordinatorReqV4wrk
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.FindCoordinatorRequest  request_api_version:4  correlation_id:0  client_id:consumer-sub-000-ufMJIvQ-1  key:""  key_type:0  coordinator_keys.0:sub-000-ufMJIvQ
# kafka2.FindCoordinatorRequest
request_api_version:4
correlation_id:0
client_id:consumer-sub-000-ufMJIvQ-1
key:""
key_type:0
coordinator_keys.0
  sub-000-ufMJIvQ

