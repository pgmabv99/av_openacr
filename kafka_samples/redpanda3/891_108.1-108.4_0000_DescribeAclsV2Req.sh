#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.DescribeAclsReqV2rdp 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.DescribeAclsReqV2rdp timeout:10  memcheck:Y  exit_code:0  comment:DescribeAclsReqV2rdp
acr.insert  atfdb.targs comptest:kapi.DescribeAclsReqV2rdp args:"-decode -hex -req:- "
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeAclsReqV2rdp/100000.in  istuple:N  msg:"00 00 00 23 00 1d 00 02 00 00 00 00 00 10 72 65 64 70 61 6e 64 61 2d 63 6f 6e 73 6f 6c 65 00 01  "
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeAclsReqV2rdp/100010.in  istuple:N  msg:"00 01 00 00 01 01 00 "
EOF
atf_comp -capture kapi.DescribeAclsReqV2rdp
atf_comp -run     kapi.DescribeAclsReqV2rdp
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.DescribeAclsRequest  request_api_version:2  correlation_id:0  client_id:redpanda-console  resource_type_filter:1  pattern_type_filter:1  operation:1  permission_type:1
