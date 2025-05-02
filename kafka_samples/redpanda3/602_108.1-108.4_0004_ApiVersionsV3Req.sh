#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.ApiVersionsReqV3rdp 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.ApiVersionsReqV3rdp timeout:10  memcheck:Y  exit_code:0  comment:ApiVersionsReqV3rdp
acr.insert  atfdb.targs comptest:kapi.ApiVersionsReqV3rdp args:"-decode -hex -req:- "
acr.insert  atfdb.tmsg  tmsg:kapi.ApiVersionsReqV3rdp/100000.in  istuple:N  msg:"00 00 00 2d 00 12 00 03 00 00 00 04 00 10 72 65 64 70 61 6e 64 61 2d 63 6f 6e 73 6f 6c 65 00 0a  "
acr.insert  atfdb.tmsg  tmsg:kapi.ApiVersionsReqV3rdp/100010.in  istuple:N  msg:"52 50 43 6f 6e 73 6f 6c 65 07 76 32 2e 38 2e 32 00 "
EOF
atf_comp -capture kapi.ApiVersionsReqV3rdp
atf_comp -run     kapi.ApiVersionsReqV3rdp
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.ApiVersionsRequest  request_api_version:3  correlation_id:4  client_id:redpanda-console  client_software_name:RPConsole  client_software_version:v2.8.2
