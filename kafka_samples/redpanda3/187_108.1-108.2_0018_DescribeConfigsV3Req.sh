#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.DescribeConfigsReqV3rdp 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.DescribeConfigsReqV3rdp timeout:10  memcheck:Y  exit_code:0  comment:DescribeConfigsReqV3rdp
acr.insert  atfdb.targs comptest:kapi.DescribeConfigsReqV3rdp args:"-decode -hex -req:- "
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsReqV3rdp/100000.in  istuple:N  msg:"00 00 00 3a 00 20 00 03 00 00 00 12 00 10 72 65 64 70 61 6e 64 61 2d 63 6f 6e 73 6f 6c 65 00 00  "
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsReqV3rdp/100010.in  istuple:N  msg:"00 01 02 00 03 61 76 31 00 00 00 01 00 0e 63 6c 65 61 6e 75 70 2e 70 6f 6c 69 63 79 01 01 "
EOF
atf_comp -capture kapi.DescribeConfigsReqV3rdp
atf_comp -run     kapi.DescribeConfigsReqV3rdp
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.DescribeConfigsRequest  request_api_version:3  correlation_id:18  client_id:redpanda-console  resources.0:"kafka2.DescribeConfigsResource32q  resource_type:2  resource_name:av1  configuration_keys.0:cleanup.policy"  include_synonyms:Y  include_documentation:Y
