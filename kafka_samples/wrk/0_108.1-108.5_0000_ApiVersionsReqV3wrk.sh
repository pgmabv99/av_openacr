#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.ApiVersionsReqV3wrk 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.ApiVersionsReqV3wrk timeout:10  memcheck:Y  exit_code:0  comment:ApiVersionsReqV3wrk
acr.insert  atfdb.targs comptest:kapi.ApiVersionsReqV3wrk args:"-decode -hex -pretty -req:-"
acr.insert  atfdb.tmsg  tmsg:kapi.ApiVersionsReqV3wrk/100000.in  istuple:N  msg:"00 00 00 3f 00 12 00 03 00 00 00 00 00 1b 6b 61 66 6b 61 2d 75 69 2d 61 64 6d 69 6e 2d 31 37 34"
acr.insert  atfdb.tmsg  tmsg:kapi.ApiVersionsReqV3wrk/100010.in  istuple:N  msg:"39 31 36 35 36 38 35 2d 31 00 12 61 70 61 63 68 65 2d 6b 61 66 6b 61 2d 6a 61 76 61 06 33 2e 35"
acr.insert  atfdb.tmsg  tmsg:kapi.ApiVersionsReqV3wrk/100020.in  istuple:N  msg:"2e 30 00"
EOF
atf_comp -capture kapi.ApiVersionsReqV3wrk
atf_comp -run     kapi.ApiVersionsReqV3wrk
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.ApiVersionsRequest  request_api_version:3  correlation_id:0  client_id:kafka-ui-admin-1749165685-1  client_software_name:apache-kafka-java  client_software_version:3.5.0
# kafka2.ApiVersionsRequest
request_api_version:3
correlation_id:0
client_id:kafka-ui-admin-1749165685-1
client_software_name:apache-kafka-java
client_software_version:3.5.0

