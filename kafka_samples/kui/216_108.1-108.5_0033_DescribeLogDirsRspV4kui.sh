#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.DescribeLogDirsRspV4kui 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.DescribeLogDirsRspV4kui timeout:10  memcheck:Y  exit_code:0  comment:DescribeLogDirsRspV4kui
acr.insert  atfdb.targs comptest:kapi.DescribeLogDirsRspV4kui args:"-decode -hex -rsp:- -apiver:33.35.4"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeLogDirsRspV4kui/100000.in  istuple:N  msg:"00 00 00 5f 00 00 00 21 00 00 00 00 00 00 00 03 00 00 15 2f 6d 6e 74 2f 64 61 74 61 2d 31 2f 64"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeLogDirsRspV4kui/100010.in  istuple:N  msg:"65 76 2e 61 6b 2d 38 01 00 00 01 be e7 e1 70 00 00 00 01 b5 88 ac 90 00 00 00 00 15 2f 6d 6e 74"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeLogDirsRspV4kui/100020.in  istuple:N  msg:"2f 64 61 74 61 2d 32 2f 64 65 76 2e 61 6b 2d 38 01 00 00 01 be e7 e1 70 00 00 00 01 b6 57 10 a0"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeLogDirsRspV4kui/100030.in  istuple:N  msg:"00 00 00"
EOF
atf_comp -capture kapi.DescribeLogDirsRspV4kui
atf_comp -run     kapi.DescribeLogDirsRspV4kui
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.DescribeLogDirsResponse  request_api_version:4  correlation_id:33  throttle_time_ms:0  error_code:0  results.0:"kafka2.DescribeLogDirsResult35a  error_code:0  log_dir:/mnt/data-1/dev.ak-8  total_bytes:1919445725184  usable_bytes:1879193718784"  results.1:"kafka2.DescribeLogDirsResult35a  error_code:0  log_dir:/mnt/data-2/dev.ak-8  total_bytes:1919445725184  usable_bytes:1882656382976"
# kafka2.DescribeLogDirsResponse
request_api_version:4
correlation_id:33
throttle_time_ms:0
error_code:0
results.0
  kafka2.DescribeLogDirsResult35a
  error_code:0
  log_dir:/mnt/data-1/dev.ak-8
  total_bytes:1919445725184
  usable_bytes:1879193718784
results.1
  kafka2.DescribeLogDirsResult35a
  error_code:0
  log_dir:/mnt/data-2/dev.ak-8
  total_bytes:1919445725184
  usable_bytes:1882656382976

