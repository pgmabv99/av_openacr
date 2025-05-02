#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.DescribeConfigsRspV3rdp 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.DescribeConfigsRspV3rdp timeout:10  memcheck:Y  exit_code:0  comment:DescribeConfigsRspV3rdp
acr.insert  atfdb.targs comptest:kapi.DescribeConfigsRspV3rdp args:"-decode -hex -rsp:- -apiver:7.32.3"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsRspV3rdp/100000.in  istuple:N  msg:"00 00 00 0c 00 00 00 07 00 00 00 00 00 00 00 00 "
EOF
atf_comp -capture kapi.DescribeConfigsRspV3rdp
atf_comp -run     kapi.DescribeConfigsRspV3rdp
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.DescribeConfigsResponse  request_api_version:3  correlation_id:7  throttle_time_ms:0
