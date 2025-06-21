#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.DescribeLogDirsReqV4kui 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.DescribeLogDirsReqV4kui timeout:10  memcheck:Y  exit_code:0  comment:DescribeLogDirsReqV4kui
acr.insert  atfdb.targs comptest:kapi.DescribeLogDirsReqV4kui args:"-decode -hex -req:-"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeLogDirsReqV4kui/100000.in  istuple:N  msg:"00 00 00 28 00 23 00 04 00 00 00 13 00 1b 6b 61 66 6b 61 2d 75 69 2d 61 64 6d 69 6e 2d 31 37 34"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeLogDirsReqV4kui/100010.in  istuple:N  msg:"36 36 34 38 33 38 36 2d 31 00 00 00"
EOF
atf_comp -capture kapi.DescribeLogDirsReqV4kui
atf_comp -run     kapi.DescribeLogDirsReqV4kui
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.DescribeLogDirsRequest  request_api_version:4  correlation_id:19  client_id:kafka-ui-admin-1746648386-1
# kafka2.DescribeLogDirsRequest
request_api_version:4
correlation_id:19
client_id:kafka-ui-admin-1746648386-1

