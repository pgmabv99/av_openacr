#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.ListOffsetsRspV5rdp 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.ListOffsetsRspV5rdp timeout:10  memcheck:Y  exit_code:0  comment:ListOffsetsRspV5rdp
acr.insert  atfdb.targs comptest:kapi.ListOffsetsRspV5rdp args:"-decode -hex -rsp:- -apiver:4.2.5"
acr.insert  atfdb.tmsg  tmsg:kapi.ListOffsetsRspV5rdp/100000.in  istuple:N  msg:"00 00 00 2f 00 00 00 04 00 00 00 00 00 00 00 01 00 03 61 76 31 00 00 00 01 00 00 00 00 00 00 ff  "
acr.insert  atfdb.tmsg  tmsg:kapi.ListOffsetsRspV5rdp/100010.in  istuple:N  msg:"ff ff ff ff ff ff ff 00 00 00 00 00 00 00 00 00 00 00 00 "
EOF
atf_comp -capture kapi.ListOffsetsRspV5rdp
atf_comp -run     kapi.ListOffsetsRspV5rdp
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.ListOffsetsResponse  request_api_version:5  correlation_id:4  throttle_time_ms:0  topics.0:'kafka2.ListOffsetsTopicResponse2a  name:av1  partitions.0:"kafka2.ListOffsetsPartitionResponse2a  partition_index:0  error_code:0  timestamp:-1  offset:0  leader_epoch:0"'
