#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.CreateTopicsReqV5rdp 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.CreateTopicsReqV5rdp timeout:10  memcheck:Y  exit_code:0  comment:CreateTopicsReqV5rdp
acr.insert  atfdb.targs comptest:kapi.CreateTopicsReqV5rdp args:"-decode -hex -req:- "
acr.insert  atfdb.tmsg  tmsg:kapi.CreateTopicsReqV5rdp/100000.in  istuple:N  msg:"00 00 00 46 00 13 00 05 00 00 00 00 00 10 72 65 64 70 61 6e 64 61 2d 63 6f 6e 73 6f 6c 65 00 02  "
acr.insert  atfdb.tmsg  tmsg:kapi.CreateTopicsReqV5rdp/100010.in  istuple:N  msg:"04 61 76 31 00 00 00 03 00 01 01 02 0f 63 6c 65 61 6e 75 70 2e 70 6f 6c 69 63 79 07 64 65 6c 65  "
acr.insert  atfdb.tmsg  tmsg:kapi.CreateTopicsReqV5rdp/100020.in  istuple:N  msg:"74 65 00 00 00 00 ea 60 00 00 "
EOF
atf_comp -capture kapi.CreateTopicsReqV5rdp
atf_comp -run     kapi.CreateTopicsReqV5rdp
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.CreateTopicsRequest  request_api_version:5  correlation_id:0  client_id:redpanda-console  topics.0:'kafka2.CreatableTopic19q  name:av1  num_partitions:3  replication_factor:1  configs.0:"kafka2.CreatableTopicConfig19q  name:cleanup.policy  value:delete"'  timeout_ms:60000  validate_only:N
