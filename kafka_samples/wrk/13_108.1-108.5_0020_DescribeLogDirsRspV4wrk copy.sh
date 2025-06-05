#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.DescribeLogDirsRspV4wrk 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.DescribeLogDirsRspV4wrk timeout:10  memcheck:Y  exit_code:0  comment:DescribeLogDirsRspV4wrk
acr.insert  atfdb.targs comptest:kapi.DescribeLogDirsRspV4wrk args:"-decode -hex -pretty -rsp:- -apiver:20.35.4"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeLogDirsRspV4wrk/100000.in  istuple:N  msg:"00 00 02 65 00 00 00 14 00 00 00 00 00 00 00 03 00 00 15 2f 6d 6e 74 2f 64 61 74 61 2d 31 2f 64"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeLogDirsRspV4wrk/100010.in  istuple:N  msg:"65 76 2e 61 6b 2d 38 03 13 5f 5f 63 6f 6e 73 75 6d 65 72 5f 6f 66 66 73 65 74 73 07 00 00 00 0c"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeLogDirsRspV4wrk/100020.in  istuple:N  msg:"00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 14 00 00 00 00 00 00 00 00 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeLogDirsRspV4wrk/100030.in  istuple:N  msg:"00 00 00 00 00 00 00 00 00 00 00 1f 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeLogDirsRspV4wrk/100040.in  istuple:N  msg:"00 19 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 05 00 00 00 00 00 00 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeLogDirsRspV4wrk/100050.in  istuple:N  msg:"00 00 00 00 00 00 00 00 00 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeLogDirsRspV4wrk/100060.in  istuple:N  msg:"00 1b 74 65 73 74 2d 74 6f 70 69 63 2d 30 30 30 30 30 30 30 2d 6f 57 70 76 64 51 4d 05 00 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeLogDirsRspV4wrk/100070.in  istuple:N  msg:"01 00 00 00 00 00 41 82 fe 00 00 00 00 00 00 00 00 00 00 00 00 00 03 00 00 00 00 00 47 91 e1 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeLogDirsRspV4wrk/100080.in  istuple:N  msg:"00 00 00 00 00 00 00 00 00 00 00 00 09 00 00 00 00 00 4e 17 08 00 00 00 00 00 00 00 00 00 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeLogDirsRspV4wrk/100090.in  istuple:N  msg:"00 00 07 00 00 00 00 00 4b a6 4c 00 00 00 00 00 00 00 00 00 00 00 00 00 01 be e7 e1 70 00 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeLogDirsRspV4wrk/100100.in  istuple:N  msg:"01 b5 e5 7c 40 00 00 00 00 15 2f 6d 6e 74 2f 64 61 74 61 2d 32 2f 64 65 76 2e 61 6b 2d 38 03 13"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeLogDirsRspV4wrk/100110.in  istuple:N  msg:"5f 5f 63 6f 6e 73 75 6d 65 72 5f 6f 66 66 73 65 74 73 07 00 00 00 2e 00 00 00 00 00 00 00 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeLogDirsRspV4wrk/100120.in  istuple:N  msg:"00 00 00 00 00 00 00 00 00 00 00 00 09 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeLogDirsRspV4wrk/100130.in  istuple:N  msg:"00 00 11 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 20 00 00 00 00 00 0a 2f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeLogDirsRspV4wrk/100140.in  istuple:N  msg:"bd 00 00 00 00 00 00 00 00 00 00 00 00 00 28 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeLogDirsRspV4wrk/100150.in  istuple:N  msg:"00 00 00 00 24 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 1b 74 65 73 74 2d 74 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeLogDirsRspV4wrk/100160.in  istuple:N  msg:"70 69 63 2d 30 30 30 30 30 30 30 2d 6f 57 70 76 64 51 4d 04 00 00 00 00 00 00 00 00 00 44 53 d0"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeLogDirsRspV4wrk/100170.in  istuple:N  msg:"00 00 00 00 00 00 00 00 00 00 00 00 00 05 00 00 00 00 00 73 53 3a 00 00 00 00 00 00 00 00 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeLogDirsRspV4wrk/100180.in  istuple:N  msg:"00 00 00 04 00 00 00 00 00 6d cc bf 00 00 00 00 00 00 00 00 00 00 00 00 00 01 be e7 e1 70 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeLogDirsRspV4wrk/100190.in  istuple:N  msg:"00 01 b6 37 21 30 00 00 00"
EOF
atf_comp -capture kapi.DescribeLogDirsRspV4wrk
atf_comp -run     kapi.DescribeLogDirsRspV4wrk
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.DescribeLogDirsResponse  request_api_version:4  correlation_id:20  throttle_time_ms:0  error_code:0  results.0:'kafka2.DescribeLogDirsResult35a  error_code:0  log_dir:/mnt/data-1/dev.ak-8  topics.0:\'kafka2.DescribeLogDirsTopic35a  name:__consumer_offsets  partitions.0:"kafka2.DescribeLogDirsPartition35a  partition_index:12  partition_size:0  offset_lag:0  is_future_key:N"  partitions.1:"kafka2.DescribeLogDirsPartition35a  partition_index:20  partition_size:0  offset_lag:0  is_future_key:N"  partitions.2:"kafka2.DescribeLogDirsPartition35a  partition_index:31  partition_size:0  offset_lag:0  is_future_key:N"  partitions.3:"kafka2.DescribeLogDirsPartition35a  partition_index:25  partition_size:0  offset_lag:0  is_future_key:N"  partitions.4:"kafka2.DescribeLogDirsPartition35a  partition_index:5  partition_size:0  offset_lag:0  is_future_key:N"  partitions.5:"kafka2.DescribeLogDirsPartition35a  partition_index:1  partition_size:0  offset_lag:0  is_future_key:N"\'  topics.1:\'kafka2.DescribeLogDirsTopic35a  name:test-topic-0000000-oWpvdQM  partitions.0:"kafka2.DescribeLogDirsPartition35a  partition_index:1  partition_size:4293374  offset_lag:0  is_future_key:N"  partitions.1:"kafka2.DescribeLogDirsPartition35a  partition_index:3  partition_size:4690401  offset_lag:0  is_future_key:N"  partitions.2:"kafka2.DescribeLogDirsPartition35a  partition_index:9  partition_size:5117704  offset_lag:0  is_future_key:N"  partitions.3:"kafka2.DescribeLogDirsPartition35a  partition_index:7  partition_size:4957772  offset_lag:0  is_future_key:N"\'  total_bytes:1919445725184  usable_bytes:1880750833664'  results.1:'kafka2.DescribeLogDirsResult35a  error_code:0  log_dir:/mnt/data-2/dev.ak-8  topics.0:\'kafka2.DescribeLogDirsTopic35a  name:__consumer_offsets  partitions.0:"kafka2.DescribeLogDirsPartition35a  partition_index:46  partition_size:0  offset_lag:0  is_future_key:N"  partitions.1:"kafka2.DescribeLogDirsPartition35a  partition_index:9  partition_size:0  offset_lag:0  is_future_key:N"  partitions.2:"kafka2.DescribeLogDirsPartition35a  partition_index:17  partition_size:0  offset_lag:0  is_future_key:N"  partitions.3:"kafka2.DescribeLogDirsPartition35a  partition_index:32  partition_size:667581  offset_lag:0  is_future_key:N"  partitions.4:"kafka2.DescribeLogDirsPartition35a  partition_index:40  partition_size:0  offset_lag:0  is_future_key:N"  partitions.5:"kafka2.DescribeLogDirsPartition35a  partition_index:36  partition_size:0  offset_lag:0  is_future_key:N"\'  topics.1:\'kafka2.DescribeLogDirsTopic35a  name:test-topic-0000000-oWpvdQM  partitions.0:"kafka2.DescribeLogDirsPartition35a  partition_index:0  partition_size:4477904  offset_lag:0  is_future_key:N"  partitions.1:"kafka2.DescribeLogDirsPartition35a  partition_index:5  partition_size:7557946  offset_lag:0  is_future_key:N"  partitions.2:"kafka2.DescribeLogDirsPartition35a  partition_index:4  partition_size:7195839  offset_lag:0  is_future_key:N"\'  total_bytes:1919445725184  usable_bytes:1882120597504'
# kafka2.DescribeLogDirsResponse
request_api_version:4
correlation_id:20
throttle_time_ms:0
error_code:0
results.0
  kafka2.DescribeLogDirsResult35a
  error_code:0
  log_dir:/mnt/data-1/dev.ak-8
  topics.0
    kafka2.DescribeLogDirsTopic35a
    name:__consumer_offsets
    partitions.0
      kafka2.DescribeLogDirsPartition35a
      partition_index:12
      partition_size:0
      offset_lag:0
      is_future_key:N
    partitions.1
      kafka2.DescribeLogDirsPartition35a
      partition_index:20
      partition_size:0
      offset_lag:0
      is_future_key:N
    partitions.2
      kafka2.DescribeLogDirsPartition35a
      partition_index:31
      partition_size:0
      offset_lag:0
      is_future_key:N
    partitions.3
      kafka2.DescribeLogDirsPartition35a
      partition_index:25
      partition_size:0
      offset_lag:0
      is_future_key:N
    partitions.4
      kafka2.DescribeLogDirsPartition35a
      partition_index:5
      partition_size:0
      offset_lag:0
      is_future_key:N
    partitions.5
      kafka2.DescribeLogDirsPartition35a
      partition_index:1
      partition_size:0
      offset_lag:0
      is_future_key:N
  topics.1
    kafka2.DescribeLogDirsTopic35a
    name:test-topic-0000000-oWpvdQM
    partitions.0
      kafka2.DescribeLogDirsPartition35a
      partition_index:1
      partition_size:4293374
      offset_lag:0
      is_future_key:N
    partitions.1
      kafka2.DescribeLogDirsPartition35a
      partition_index:3
      partition_size:4690401
      offset_lag:0
      is_future_key:N
    partitions.2
      kafka2.DescribeLogDirsPartition35a
      partition_index:9
      partition_size:5117704
      offset_lag:0
      is_future_key:N
    partitions.3
      kafka2.DescribeLogDirsPartition35a
      partition_index:7
      partition_size:4957772
      offset_lag:0
      is_future_key:N
  total_bytes:1919445725184
  usable_bytes:1880750833664
results.1
  kafka2.DescribeLogDirsResult35a
  error_code:0
  log_dir:/mnt/data-2/dev.ak-8
  topics.0
    kafka2.DescribeLogDirsTopic35a
    name:__consumer_offsets
    partitions.0
      kafka2.DescribeLogDirsPartition35a
      partition_index:46
      partition_size:0
      offset_lag:0
      is_future_key:N
    partitions.1
      kafka2.DescribeLogDirsPartition35a
      partition_index:9
      partition_size:0
      offset_lag:0
      is_future_key:N
    partitions.2
      kafka2.DescribeLogDirsPartition35a
      partition_index:17
      partition_size:0
      offset_lag:0
      is_future_key:N
    partitions.3
      kafka2.DescribeLogDirsPartition35a
      partition_index:32
      partition_size:667581
      offset_lag:0
      is_future_key:N
    partitions.4
      kafka2.DescribeLogDirsPartition35a
      partition_index:40
      partition_size:0
      offset_lag:0
      is_future_key:N
    partitions.5
      kafka2.DescribeLogDirsPartition35a
      partition_index:36
      partition_size:0
      offset_lag:0
      is_future_key:N
  topics.1
    kafka2.DescribeLogDirsTopic35a
    name:test-topic-0000000-oWpvdQM
    partitions.0
      kafka2.DescribeLogDirsPartition35a
      partition_index:0
      partition_size:4477904
      offset_lag:0
      is_future_key:N
    partitions.1
      kafka2.DescribeLogDirsPartition35a
      partition_index:5
      partition_size:7557946
      offset_lag:0
      is_future_key:N
    partitions.2
      kafka2.DescribeLogDirsPartition35a
      partition_index:4
      partition_size:7195839
      offset_lag:0
      is_future_key:N
  total_bytes:1919445725184
  usable_bytes:1882120597504

