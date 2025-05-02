#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.DescribeConfigsReqV3rdp 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.DescribeConfigsReqV3rdp timeout:10  memcheck:Y  exit_code:0  comment:DescribeConfigsReqV3rdp
acr.insert  atfdb.targs comptest:kapi.DescribeConfigsReqV3rdp args:"-decode -hex -req:- "
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsReqV3rdp/100000.in  istuple:N  msg:"00 00 00 20 00 20 00 03 00 00 00 07 00 10 72 65 64 70 61 6e 64 61 2d 63 6f 6e 73 6f 6c 65 00 00  "
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsReqV3rdp/100010.in  istuple:N  msg:"00 00 01 01 "
EOF
atf_comp -capture kapi.DescribeConfigsReqV3rdp
atf_comp -run     kapi.DescribeConfigsReqV3rdp
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.DescribeConfigsRequest  request_api_version:3  correlation_id:7  client_id:redpanda-console  include_synonyms:Y  include_documentation:Y
