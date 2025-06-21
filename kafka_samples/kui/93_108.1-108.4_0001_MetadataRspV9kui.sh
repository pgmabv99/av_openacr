#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.MetadataRspV9kui 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.MetadataRspV9kui timeout:10  memcheck:Y  exit_code:0  comment:MetadataRspV9kui
acr.insert  atfdb.targs comptest:kapi.MetadataRspV9kui args:"-decode -hex -rsp:- -apiver:1.3.9"
acr.insert  atfdb.tmsg  tmsg:kapi.MetadataRspV9kui/100000.in  istuple:N  msg:"00 00 00 1d 00 00 00 01 00 00 00 00 00 01 09 64 65 76 2e 61 6b 2d 38 ff ff ff ff 01 80 00 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.MetadataRspV9kui/100010.in  istuple:N  msg:"00"
EOF
atf_comp -capture kapi.MetadataRspV9kui
atf_comp -run     kapi.MetadataRspV9kui
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.MetadataResponse  request_api_version:9  correlation_id:1  throttle_time_ms:0  cluster_id:dev.ak-8  controller_id:-1  cluster_authorized_operations:-2147483648  error_code:0
# kafka2.MetadataResponse
request_api_version:9
correlation_id:1
throttle_time_ms:0
cluster_id:dev.ak-8
controller_id:-1
cluster_authorized_operations:-2147483648
error_code:0

