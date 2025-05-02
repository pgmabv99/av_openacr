#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.DescribeAclsRspV2rdp 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.DescribeAclsRspV2rdp timeout:10  memcheck:Y  exit_code:0  comment:DescribeAclsRspV2rdp
acr.insert  atfdb.targs comptest:kapi.DescribeAclsRspV2rdp args:"-decode -hex -rsp:- -apiver:14.29.2"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeAclsRspV2rdp/100000.in  istuple:N  msg:"00 00 00 0e 00 00 00 0e 00 00 00 00 00 00 00 01 01 00 "
EOF
atf_comp -capture kapi.DescribeAclsRspV2rdp
atf_comp -run     kapi.DescribeAclsRspV2rdp
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.DescribeAclsResponse  request_api_version:2  correlation_id:14  throttle_time_ms:0  error_code:0  error_message:""
