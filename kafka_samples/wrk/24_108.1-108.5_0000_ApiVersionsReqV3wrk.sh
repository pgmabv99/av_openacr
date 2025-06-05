#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.ApiVersionsReqV3wrk 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.ApiVersionsReqV3wrk timeout:10  memcheck:Y  exit_code:0  comment:ApiVersionsReqV3wrk
acr.insert  atfdb.targs comptest:kapi.ApiVersionsReqV3wrk args:"-decode -hex -pretty -req:-"
acr.insert  atfdb.tmsg  tmsg:kapi.ApiVersionsReqV3wrk/100000.in  istuple:N  msg:"00 00 00 28 00 12 00 03 00 00 00 00 00 10 72 65 64 70 61 6e 64 61 2d 63 6f 6e 73 6f 6c 65 00 04"
acr.insert  atfdb.tmsg  tmsg:kapi.ApiVersionsReqV3wrk/100010.in  istuple:N  msg:"6b 67 6f 08 76 31 2e 31 38 2e 30 00"
EOF
atf_comp -capture kapi.ApiVersionsReqV3wrk
atf_comp -run     kapi.ApiVersionsReqV3wrk
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.ApiVersionsRequest  request_api_version:3  correlation_id:0  client_id:redpanda-console  client_software_name:kgo  client_software_version:v1.18.0
# kafka2.ApiVersionsRequest
request_api_version:3
correlation_id:0
client_id:redpanda-console
client_software_name:kgo
client_software_version:v1.18.0

