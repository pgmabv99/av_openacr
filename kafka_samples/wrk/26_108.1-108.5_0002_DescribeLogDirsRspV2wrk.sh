#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.DescribeLogDirsRspV2wrk 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.DescribeLogDirsRspV2wrk timeout:10  memcheck:Y  exit_code:0  comment:DescribeLogDirsRspV2wrk
acr.insert  atfdb.targs comptest:kapi.DescribeLogDirsRspV2wrk args:"-decode -hex -pretty -rsp:- -apiver:2.35.2"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeLogDirsRspV2wrk/100000.in  istuple:N  msg:"00 00 00 3d 00 00 00 02 00 00 00 00 00 03 00 00 15 2f 6d 6e 74 2f 64 61 74 61 2d 31 2f 64 65 76"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeLogDirsRspV2wrk/100010.in  istuple:N  msg:"2e 61 6b 2d 38 01 00 00 00 15 2f 6d 6e 74 2f 64 61 74 61 2d 32 2f 64 65 76 2e 61 6b 2d 38 01 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeLogDirsRspV2wrk/100020.in  istuple:N  msg:"00"
EOF
atf_comp -capture kapi.DescribeLogDirsRspV2wrk
atf_comp -run     kapi.DescribeLogDirsRspV2wrk
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.DescribeLogDirsResponse  request_api_version:2  correlation_id:2  throttle_time_ms:0  error_code:0  results.0:"kafka2.DescribeLogDirsResult35a  error_code:0  log_dir:/mnt/data-1/dev.ak-8  total_bytes:-1  usable_bytes:-1"  results.1:"kafka2.DescribeLogDirsResult35a  error_code:0  log_dir:/mnt/data-2/dev.ak-8  total_bytes:-1  usable_bytes:-1"
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

