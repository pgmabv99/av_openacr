#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.DescribeLogDirsRspV4kui 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.DescribeLogDirsRspV4kui timeout:10  memcheck:Y  exit_code:0  comment:DescribeLogDirsRspV4kui
acr.insert  atfdb.targs comptest:kapi.DescribeLogDirsRspV4kui args:"-decode -hex -rsp:- -apiver:9.35.4"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeLogDirsRspV4kui/100000.in  istuple:N  msg:"00 00 00 b1 00 00 00 09 00 00 00 00 00 00 00 05 00 00 15 2f 6d 6e 74 2f 64 61 74 61 2d 31 2f 64"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeLogDirsRspV4kui/100010.in  istuple:N  msg:"65 76 2e 61 6b 2d 38 01 00 00 01 be e7 e1 70 00 00 00 01 b5 70 a9 a0 00 00 00 00 15 2f 6d 6e 74"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeLogDirsRspV4kui/100020.in  istuple:N  msg:"2f 64 61 74 61 2d 32 2f 64 65 76 2e 61 6b 2d 38 01 00 00 01 be e7 e1 70 00 00 00 01 b6 3f fa 40"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeLogDirsRspV4kui/100030.in  istuple:N  msg:"00 00 00 00 15 2f 6d 6e 74 2f 64 61 74 61 2d 33 2f 64 65 76 2e 61 6b 2d 38 01 00 00 01 be e7 e1"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeLogDirsRspV4kui/100040.in  istuple:N  msg:"70 00 00 00 01 b6 48 2b 40 00 00 00 00 15 2f 6d 6e 74 2f 64 61 74 61 2d 34 2f 64 65 76 2e 61 6b"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeLogDirsRspV4kui/100050.in  istuple:N  msg:"2d 38 01 00 00 01 be e7 e1 70 00 00 00 01 b6 47 f4 30 00 00 00"
EOF
atf_comp -capture kapi.DescribeLogDirsRspV4kui
atf_comp -run     kapi.DescribeLogDirsRspV4kui
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.DescribeLogDirsResponse  request_api_version:4  correlation_id:9  throttle_time_ms:0  error_code:0  results.0:"kafka2.DescribeLogDirsResult35a  error_code:0  log_dir:/mnt/data-1/dev.ak-8  total_bytes:1919445725184  usable_bytes:1878790873088"  results.1:"kafka2.DescribeLogDirsResult35a  error_code:0  log_dir:/mnt/data-2/dev.ak-8  total_bytes:1919445725184  usable_bytes:1882269040640"  results.2:"kafka2.DescribeLogDirsResult35a  error_code:0  log_dir:/mnt/data-3/dev.ak-8  total_bytes:1919445725184  usable_bytes:1882406469632"  results.3:"kafka2.DescribeLogDirsResult35a  error_code:0  log_dir:/mnt/data-4/dev.ak-8  total_bytes:1919445725184  usable_bytes:1882402861056"
# kafka2.DescribeLogDirsResponse
request_api_version:4
correlation_id:9
throttle_time_ms:0
error_code:0
results.0
  kafka2.DescribeLogDirsResult35a
  error_code:0
  log_dir:/mnt/data-1/dev.ak-8
  total_bytes:1919445725184
  usable_bytes:1878790873088
results.1
  kafka2.DescribeLogDirsResult35a
  error_code:0
  log_dir:/mnt/data-2/dev.ak-8
  total_bytes:1919445725184
  usable_bytes:1882269040640
results.2
  kafka2.DescribeLogDirsResult35a
  error_code:0
  log_dir:/mnt/data-3/dev.ak-8
  total_bytes:1919445725184
  usable_bytes:1882406469632
results.3
  kafka2.DescribeLogDirsResult35a
  error_code:0
  log_dir:/mnt/data-4/dev.ak-8
  total_bytes:1919445725184
  usable_bytes:1882402861056

