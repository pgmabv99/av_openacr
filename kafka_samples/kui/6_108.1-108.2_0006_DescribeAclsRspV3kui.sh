#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.DescribeAclsRspV3kui 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.DescribeAclsRspV3kui timeout:10  memcheck:Y  exit_code:0  comment:DescribeAclsRspV3kui
acr.insert  atfdb.targs comptest:kapi.DescribeAclsRspV3kui args:"-decode -hex -rsp:- -apiver:6.29.3"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeAclsRspV3kui/100000.in  istuple:N  msg:"00 00 00 0e 00 00 00 06 00 00 00 00 00 00 00 01 01 00"
EOF
atf_comp -capture kapi.DescribeAclsRspV3kui
atf_comp -run     kapi.DescribeAclsRspV3kui
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.DescribeAclsResponse  request_api_version:3  correlation_id:6  throttle_time_ms:0  error_code:0  error_message:""
# kafka2.DescribeAclsResponse
request_api_version:3
correlation_id:6
throttle_time_ms:0
error_code:0
error_message:""

