#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.ProduceRspV8rdp 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.ProduceRspV8rdp timeout:10  memcheck:Y  exit_code:0  comment:ProduceRspV8rdp
acr.insert  atfdb.targs comptest:kapi.ProduceRspV8rdp args:"-decode -hex -rsp:- -apiver:1.0.8"
acr.insert  atfdb.tmsg  tmsg:kapi.ProduceRspV8rdp/100000.in  istuple:N  msg:"00 00 00 39 00 00 00 01 00 00 00 01 00 03 61 76 31 00 00 00 01 00 00 00 02 00 00 00 00 00 00 00  "
acr.insert  atfdb.tmsg  tmsg:kapi.ProduceRspV8rdp/100010.in  istuple:N  msg:"00 00 01 ff ff ff ff ff ff ff ff 00 00 00 00 00 00 00 00 00 00 00 00 ff ff 00 00 00 00 "
EOF
atf_comp -capture kapi.ProduceRspV8rdp
atf_comp -run     kapi.ProduceRspV8rdp
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.ProduceResponse  request_api_version:8  correlation_id:1  responses.0:"kafka2.TopicProduceResponse0a  name:av1  partition_responses.0:'kafka2.PartitionProduceResponse0a  index:2  error_code:0  base_offset:1  log_append_time_ms:-1  log_start_offset:0  current_leader:\"kafka2.LeaderIdAndEpoch0a  leader_id:-1  leader_epoch:-1\"'"  throttle_time_ms:0
