#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.DescribeLogDirsReqV2rdp 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.DescribeLogDirsReqV2rdp timeout:10  memcheck:Y  exit_code:0  comment:DescribeLogDirsReqV2rdp
acr.insert  atfdb.targs comptest:kapi.DescribeLogDirsReqV2rdp args:"-decode -hex -req:- "
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeLogDirsReqV2rdp/100000.in  istuple:N  msg:"00 00 00 1d 00 23 00 02 00 00 00 0e 00 10 72 65 64 70 61 6e 64 61 2d 63 6f 6e 73 6f 6c 65 00 00  "
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeLogDirsReqV2rdp/100010.in  istuple:N  msg:"00 "
EOF
atf_comp -capture kapi.DescribeLogDirsReqV2rdp
atf_comp -run     kapi.DescribeLogDirsReqV2rdp
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.DescribeLogDirsRequest  request_api_version:2  correlation_id:14  client_id:redpanda-console
