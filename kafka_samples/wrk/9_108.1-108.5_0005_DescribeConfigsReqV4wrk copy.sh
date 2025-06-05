#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.DescribeConfigsReqV4wrk 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.DescribeConfigsReqV4wrk timeout:10  memcheck:Y  exit_code:0  comment:DescribeConfigsReqV4wrk
acr.insert  atfdb.targs comptest:kapi.DescribeConfigsReqV4wrk args:"-decode -hex -pretty -req:-"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsReqV4wrk/100000.in  istuple:N  msg:"00 00 00 2f 00 20 00 04 00 00 00 05 00 1b 6b 61 66 6b 61 2d 75 69 2d 61 64 6d 69 6e 2d 31 37 34"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeConfigsReqV4wrk/100010.in  istuple:N  msg:"39 31 36 35 36 38 35 2d 31 00 02 04 02 34 00 00 00 00 00"
EOF
atf_comp -capture kapi.DescribeConfigsReqV4wrk
atf_comp -run     kapi.DescribeConfigsReqV4wrk
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.DescribeConfigsRequest  request_api_version:4  correlation_id:5  client_id:kafka-ui-admin-1749165685-1  resources.0:"kafka2.DescribeConfigsResource32q  resource_type:4  resource_name:4"  include_synonyms:N  include_documentation:N
# kafka2.DescribeConfigsRequest
request_api_version:4
correlation_id:5
client_id:kafka-ui-admin-1749165685-1
resources.0
  kafka2.DescribeConfigsResource32q
  resource_type:4
  resource_name:4
include_synonyms:N
include_documentation:N

