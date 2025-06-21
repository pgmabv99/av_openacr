#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.DescribeConfigsReqV3kui 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.DescribeConfigsReqV3kui timeout:10  memcheck:Y  exit_code:0  comment:DescribeConfigsReqV3kui
acr.insert  atfdb.targs comptest:kapi.DescribeConfigsReqV3kui args:"-decode -hex -req:-"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsReqV3kui/100000.in  istuple:N  msg:"00 00 00 28 00 20 00 03 00 00 00 01 00 10 72 65 64 70 61 6e 64 61 2d 63 6f 6e 73 6f 6c 65 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsReqV3kui/100010.in  istuple:N  msg:"00 01 04 00 01 31 ff ff ff ff 01 00"
EOF
atf_comp -capture kapi.DescribeConfigsReqV3kui
atf_comp -run     kapi.DescribeConfigsReqV3kui
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.DescribeConfigsRequest  request_api_version:3  correlation_id:1  client_id:redpanda-console  resources.0:"kafka2.DescribeConfigsResource32q  resource_type:4  resource_name:1"  include_synonyms:Y  include_documentation:N
# kafka2.DescribeConfigsRequest
request_api_version:3
correlation_id:1
client_id:redpanda-console
resources.0
  kafka2.DescribeConfigsResource32q
  resource_type:4
  resource_name:1
include_synonyms:Y
include_documentation:N

