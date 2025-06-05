#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.ApiVersionsReqV3wrk 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.ApiVersionsReqV3wrk timeout:10  memcheck:Y  exit_code:0  comment:ApiVersionsReqV3wrk
acr.insert  atfdb.targs comptest:kapi.ApiVersionsReqV3wrk args:"-decode -hex -pretty -req:-"
acr.insert  atfdb.tmsg  tmsg:kapi.ApiVersionsReqV3wrk/100000.in  istuple:N  msg:"00 00 00 3e 00 12 00 03 00 00 00 0a 00 1a 63 6f 6e 73 75 6d 65 72 2d 73 75 62 2d 30 30 30 2d 75"
acr.insert  atfdb.tmsg  tmsg:kapi.ApiVersionsReqV3wrk/100010.in  istuple:N  msg:"66 4d 4a 49 76 51 2d 31 00 12 61 70 61 63 68 65 2d 6b 61 66 6b 61 2d 6a 61 76 61 06 33 2e 36 2e"
acr.insert  atfdb.tmsg  tmsg:kapi.ApiVersionsReqV3wrk/100020.in  istuple:N  msg:"31 00"
EOF
atf_comp -capture kapi.ApiVersionsReqV3wrk
atf_comp -run     kapi.ApiVersionsReqV3wrk
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.ApiVersionsRequest  request_api_version:3  correlation_id:10  client_id:consumer-sub-000-ufMJIvQ-1  client_software_name:apache-kafka-java  client_software_version:3.6.1
# kafka2.ApiVersionsRequest
request_api_version:3
correlation_id:10
client_id:consumer-sub-000-ufMJIvQ-1
client_software_name:apache-kafka-java
client_software_version:3.6.1

