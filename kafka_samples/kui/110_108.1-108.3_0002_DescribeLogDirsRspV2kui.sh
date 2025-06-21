#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.DescribeLogDirsRspV2kui 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.DescribeLogDirsRspV2kui timeout:10  memcheck:Y  exit_code:0  comment:DescribeLogDirsRspV2kui
acr.insert  atfdb.targs comptest:kapi.DescribeLogDirsRspV2kui args:"-decode -hex -rsp:- -apiver:2.35.2"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeLogDirsRspV2kui/100000.in  istuple:N  msg:"00 00 00 56 00 00 00 02 00 00 00 00 00 04 00 00 15 2f 6d 6e 74 2f 64 61 74 61 2d 31 2f 64 65 76"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeLogDirsRspV2kui/100010.in  istuple:N  msg:"2e 61 6b 2d 38 01 00 00 00 15 2f 6d 6e 74 2f 64 61 74 61 2d 32 2f 64 65 76 2e 61 6b 2d 38 01 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeLogDirsRspV2kui/100020.in  istuple:N  msg:"00 00 15 2f 6d 6e 74 2f 64 61 74 61 2d 33 2f 64 65 76 2e 61 6b 2d 38 01 00 00"
EOF
atf_comp -capture kapi.DescribeLogDirsRspV2kui
atf_comp -run     kapi.DescribeLogDirsRspV2kui
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.DescribeLogDirsResponse  request_api_version:2  correlation_id:2  throttle_time_ms:0  error_code:0  results.0:"kafka2.DescribeLogDirsResult35a  error_code:0  log_dir:/mnt/data-1/dev.ak-8  total_bytes:-1  usable_bytes:-1"  results.1:"kafka2.DescribeLogDirsResult35a  error_code:0  log_dir:/mnt/data-2/dev.ak-8  total_bytes:-1  usable_bytes:-1"  results.2:"kafka2.DescribeLogDirsResult35a  error_code:0  log_dir:/mnt/data-3/dev.ak-8  total_bytes:-1  usable_bytes:-1"
# kafka2.DescribeLogDirsResponse
request_api_version:2
correlation_id:2
throttle_time_ms:0
error_code:0
results.0
  kafka2.DescribeLogDirsResult35a
  error_code:0
  log_dir:/mnt/data-1/dev.ak-8
  total_bytes:-1
  usable_bytes:-1
results.1
  kafka2.DescribeLogDirsResult35a
  error_code:0
  log_dir:/mnt/data-2/dev.ak-8
  total_bytes:-1
  usable_bytes:-1
results.2
  kafka2.DescribeLogDirsResult35a
  error_code:0
  log_dir:/mnt/data-3/dev.ak-8
  total_bytes:-1
  usable_bytes:-1

