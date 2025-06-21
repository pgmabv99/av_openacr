#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.DescribeAclsReqV3kui 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.DescribeAclsReqV3kui timeout:10  memcheck:Y  exit_code:0  comment:DescribeAclsReqV3kui
acr.insert  atfdb.targs comptest:kapi.DescribeAclsReqV3kui args:"-decode -hex -req:-"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeAclsReqV3kui/100000.in  istuple:N  msg:"00 00 00 2e 00 1d 00 03 00 00 00 06 00 1b 6b 61 66 6b 61 2d 75 69 2d 61 64 6d 69 6e 2d 31 37 34"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeAclsReqV3kui/100010.in  istuple:N  msg:"36 36 34 38 32 32 37 2d 31 00 01 00 01 00 00 01 01 00"
EOF
atf_comp -capture kapi.DescribeAclsReqV3kui
atf_comp -run     kapi.DescribeAclsReqV3kui
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.DescribeAclsRequest  request_api_version:3  correlation_id:6  client_id:kafka-ui-admin-1746648227-1  resource_type_filter:1  pattern_type_filter:1  operation:1  permission_type:1
# kafka2.DescribeAclsRequest
request_api_version:3
correlation_id:6
client_id:kafka-ui-admin-1746648227-1
resource_type_filter:1
pattern_type_filter:1
operation:1
permission_type:1

