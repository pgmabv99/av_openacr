#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.OffsetFetchRspV8wrk 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.OffsetFetchRspV8wrk timeout:10  memcheck:Y  exit_code:0  comment:OffsetFetchRspV8wrk
acr.insert  atfdb.targs comptest:kapi.OffsetFetchRspV8wrk args:"-decode -hex -pretty -rsp:- -apiver:14.9.8"
acr.insert  atfdb.tmsg  tmsg:kapi.OffsetFetchRspV8wrk/100000.in  istuple:N  msg:"00 00 01 04 00 00 00 0e 00 00 00 00 00 02 10 73 75 62 2d 30 30 30 2d 75 66 4d 4a 49 76 51 02 1b"
acr.insert  atfdb.tmsg  tmsg:kapi.OffsetFetchRspV8wrk/100010.in  istuple:N  msg:"74 65 73 74 2d 74 6f 70 69 63 2d 30 30 30 30 30 30 30 2d 6f 57 70 76 64 51 4d 0b 00 00 00 08 ff"
acr.insert  atfdb.tmsg  tmsg:kapi.OffsetFetchRspV8wrk/100020.in  istuple:N  msg:"ff ff ff ff ff ff ff ff ff ff ff 01 00 00 00 00 00 00 09 ff ff ff ff ff ff ff ff ff ff ff ff 01"
acr.insert  atfdb.tmsg  tmsg:kapi.OffsetFetchRspV8wrk/100030.in  istuple:N  msg:"00 00 00 00 00 00 05 ff ff ff ff ff ff ff ff ff ff ff ff 01 00 00 00 00 00 00 01 ff ff ff ff ff"
acr.insert  atfdb.tmsg  tmsg:kapi.OffsetFetchRspV8wrk/100040.in  istuple:N  msg:"ff ff ff ff ff ff ff 01 00 00 00 00 00 00 04 ff ff ff ff ff ff ff ff ff ff ff ff 01 00 00 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.OffsetFetchRspV8wrk/100050.in  istuple:N  msg:"00 00 00 ff ff ff ff ff ff ff ff ff ff ff ff 01 00 00 00 00 00 00 07 ff ff ff ff ff ff ff ff ff"
acr.insert  atfdb.tmsg  tmsg:kapi.OffsetFetchRspV8wrk/100060.in  istuple:N  msg:"ff ff ff 01 00 00 00 00 00 00 03 ff ff ff ff ff ff ff ff ff ff ff ff 01 00 00 00 00 00 00 06 ff"
acr.insert  atfdb.tmsg  tmsg:kapi.OffsetFetchRspV8wrk/100070.in  istuple:N  msg:"ff ff ff ff ff ff ff ff ff ff ff 01 00 00 00 00 00 00 02 ff ff ff ff ff ff ff ff ff ff ff ff 01"
acr.insert  atfdb.tmsg  tmsg:kapi.OffsetFetchRspV8wrk/100080.in  istuple:N  msg:"00 00 00 00 00 00 00 00"
EOF
atf_comp -capture kapi.OffsetFetchRspV8wrk
atf_comp -run     kapi.OffsetFetchRspV8wrk
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.OffsetFetchResponse  request_api_version:8  correlation_id:14  throttle_time_ms:0  error_code:0  groups.0:'kafka2.OffsetFetchResponseGroup9a  group_id:sub-000-ufMJIvQ  topics.0:"kafka2.OffsetFetchResponseTopics9a  name:test-topic-0000000-oWpvdQM  partitions.0:\'kafka2.OffsetFetchResponsePartitions9a  partition_index:8  committed_offset:-1  committed_leader_epoch:-1  metadata:\\"\\"  error_code:0\'  partitions.1:\'kafka2.OffsetFetchResponsePartitions9a  partition_index:9  committed_offset:-1  committed_leader_epoch:-1  metadata:\\"\\"  error_code:0\'  partitions.2:\'kafka2.OffsetFetchResponsePartitions9a  partition_index:5  committed_offset:-1  committed_leader_epoch:-1  metadata:\\"\\"  error_code:0\'  partitions.3:\'kafka2.OffsetFetchResponsePartitions9a  partition_index:1  committed_offset:-1  committed_leader_epoch:-1  metadata:\\"\\"  error_code:0\'  partitions.4:\'kafka2.OffsetFetchResponsePartitions9a  partition_index:4  committed_offset:-1  committed_leader_epoch:-1  metadata:\\"\\"  error_code:0\'  partitions.5:\'kafka2.OffsetFetchResponsePartitions9a  partition_index:0  committed_offset:-1  committed_leader_epoch:-1  metadata:\\"\\"  error_code:0\'  partitions.6:\'kafka2.OffsetFetchResponsePartitions9a  partition_index:7  committed_offset:-1  committed_leader_epoch:-1  metadata:\\"\\"  error_code:0\'  partitions.7:\'kafka2.OffsetFetchResponsePartitions9a  partition_index:3  committed_offset:-1  committed_leader_epoch:-1  metadata:\\"\\"  error_code:0\'  partitions.8:\'kafka2.OffsetFetchResponsePartitions9a  partition_index:6  committed_offset:-1  committed_leader_epoch:-1  metadata:\\"\\"  error_code:0\'  partitions.9:\'kafka2.OffsetFetchResponsePartitions9a  partition_index:2  committed_offset:-1  committed_leader_epoch:-1  metadata:\\"\\"  error_code:0\'"  error_code:0'
# kafka2.OffsetFetchResponse
request_api_version:8
correlation_id:14
throttle_time_ms:0
error_code:0
groups.0
  kafka2.OffsetFetchResponseGroup9a
  group_id:sub-000-ufMJIvQ
  topics.0
    kafka2.OffsetFetchResponseTopics9a
    name:test-topic-0000000-oWpvdQM
    partitions.0
      kafka2.OffsetFetchResponsePartitions9a
      partition_index:8
      committed_offset:-1
      committed_leader_epoch:-1
      metadata:""
      error_code:0
    partitions.1
      kafka2.OffsetFetchResponsePartitions9a
      partition_index:9
      committed_offset:-1
      committed_leader_epoch:-1
      metadata:""
      error_code:0
    partitions.2
      kafka2.OffsetFetchResponsePartitions9a
      partition_index:5
      committed_offset:-1
      committed_leader_epoch:-1
      metadata:""
      error_code:0
    partitions.3
      kafka2.OffsetFetchResponsePartitions9a
      partition_index:1
      committed_offset:-1
      committed_leader_epoch:-1
      metadata:""
      error_code:0
    partitions.4
      kafka2.OffsetFetchResponsePartitions9a
      partition_index:4
      committed_offset:-1
      committed_leader_epoch:-1
      metadata:""
      error_code:0
    partitions.5
      kafka2.OffsetFetchResponsePartitions9a
      partition_index:0
      committed_offset:-1
      committed_leader_epoch:-1
      metadata:""
      error_code:0
    partitions.6
      kafka2.OffsetFetchResponsePartitions9a
      partition_index:7
      committed_offset:-1
      committed_leader_epoch:-1
      metadata:""
      error_code:0
    partitions.7
      kafka2.OffsetFetchResponsePartitions9a
      partition_index:3
      committed_offset:-1
      committed_leader_epoch:-1
      metadata:""
      error_code:0
    partitions.8
      kafka2.OffsetFetchResponsePartitions9a
      partition_index:6
      committed_offset:-1
      committed_leader_epoch:-1
      metadata:""
      error_code:0
    partitions.9
      kafka2.OffsetFetchResponsePartitions9a
      partition_index:2
      committed_offset:-1
      committed_leader_epoch:-1
      metadata:""
      error_code:0
  error_code:0

