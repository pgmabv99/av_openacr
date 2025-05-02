#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.DescribeLogDirsRspV2rdp 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.DescribeLogDirsRspV2rdp timeout:10  memcheck:Y  exit_code:0  comment:DescribeLogDirsRspV2rdp
acr.insert  atfdb.targs comptest:kapi.DescribeLogDirsRspV2rdp args:"-decode -hex -rsp:- -apiver:21.35.2"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeLogDirsRspV2rdp/100000.in  istuple:N  msg:"00 00 00 59 00 00 00 15 00 00 00 00 00 03 00 00 15 2f 6d 6e 74 2f 64 61 74 61 2d 31 2f 64 65 76  "
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeLogDirsRspV2rdp/100010.in  istuple:N  msg:"2e 61 6b 2d 38 02 04 61 76 31 02 00 00 00 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  "
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeLogDirsRspV2rdp/100020.in  istuple:N  msg:"00 00 00 00 00 15 2f 6d 6e 74 2f 64 61 74 61 2d 32 2f 64 65 76 2e 61 6b 2d 38 01 00 00 "
EOF
atf_comp -capture kapi.DescribeLogDirsRspV2rdp
atf_comp -run     kapi.DescribeLogDirsRspV2rdp
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.DescribeLogDirsResponse  request_api_version:2  correlation_id:21  throttle_time_ms:0  error_code:0  results.0:"kafka2.DescribeLogDirsResult35a  error_code:0  log_dir:/mnt/data-1/dev.ak-8  topics.0:'kafka2.DescribeLogDirsTopic35a  name:av1  partitions.0:\"kafka2.DescribeLogDirsPartition35a  partition_index:1  partition_size:0  offset_lag:0  is_future_key:N\"'  total_bytes:-1  usable_bytes:-1"  results.1:"kafka2.DescribeLogDirsResult35a  error_code:0  log_dir:/mnt/data-2/dev.ak-8  total_bytes:-1  usable_bytes:-1"
