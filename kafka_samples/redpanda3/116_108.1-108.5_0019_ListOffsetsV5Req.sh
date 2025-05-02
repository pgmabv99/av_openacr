#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.ListOffsetsReqV5rdp 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.ListOffsetsReqV5rdp timeout:10  memcheck:Y  exit_code:0  comment:ListOffsetsReqV5rdp
acr.insert  atfdb.targs comptest:kapi.ListOffsetsReqV5rdp args:"-decode -hex -req:- "
acr.insert  atfdb.tmsg  tmsg:kapi.ListOffsetsReqV5rdp/100000.in  istuple:N  msg:"00 00 00 3c 00 02 00 05 00 00 00 13 00 10 72 65 64 70 61 6e 64 61 2d 63 6f 6e 73 6f 6c 65 00 00  "
acr.insert  atfdb.tmsg  tmsg:kapi.ListOffsetsReqV5rdp/100010.in  istuple:N  msg:"00 00 00 00 00 00 01 00 03 61 76 31 00 00 00 01 00 00 00 01 ff ff ff ff ff ff ff ff ff ff ff fe "
EOF
atf_comp -capture kapi.ListOffsetsReqV5rdp
atf_comp -run     kapi.ListOffsetsReqV5rdp
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.ListOffsetsRequest  request_api_version:5  correlation_id:19  client_id:redpanda-console  replica_id:0  isolation_level:0  topics.0:'kafka2.ListOffsetsTopic2q  name:av1  partitions.0:"kafka2.ListOffsetsPartition2q  partition_index:1  current_leader_epoch:-1  timestamp:-2"'  timeout_ms:0
