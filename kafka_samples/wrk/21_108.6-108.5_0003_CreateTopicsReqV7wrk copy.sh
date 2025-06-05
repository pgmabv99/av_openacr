#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.CreateTopicsReqV7wrk 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.CreateTopicsReqV7wrk timeout:10  memcheck:Y  exit_code:0  comment:CreateTopicsReqV7wrk
acr.insert  atfdb.targs comptest:kapi.CreateTopicsReqV7wrk args:"-decode -hex -pretty -req:-"
acr.insert  atfdb.tmsg  tmsg:kapi.CreateTopicsReqV7wrk/100000.in  istuple:N  msg:"00 00 00 5a 00 13 00 07 00 00 00 03 00 0d 61 64 6d 69 6e 63 6c 69 65 6e 74 2d 31 00 02 1b 74 65"
acr.insert  atfdb.tmsg  tmsg:kapi.CreateTopicsReqV7wrk/100010.in  istuple:N  msg:"73 74 2d 74 6f 70 69 63 2d 30 30 30 30 30 30 30 2d 6f 57 70 76 64 51 4d 00 00 00 0a 00 03 01 02"
acr.insert  atfdb.tmsg  tmsg:kapi.CreateTopicsReqV7wrk/100020.in  istuple:N  msg:"14 6d 69 6e 2e 69 6e 73 79 6e 63 2e 72 65 70 6c 69 63 61 73 02 32 00 00 00 00 75 2b 00 00"
EOF
atf_comp -capture kapi.CreateTopicsReqV7wrk
atf_comp -run     kapi.CreateTopicsReqV7wrk
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.CreateTopicsRequest  request_api_version:7  correlation_id:3  client_id:adminclient-1  topics.0:'kafka2.CreatableTopic19q  name:test-topic-0000000-oWpvdQM  num_partitions:10  replication_factor:3  configs.0:"kafka2.CreatableTopicConfig19q  name:min.insync.replicas  value:2"'  timeout_ms:29995  validate_only:N
# kafka2.CreateTopicsRequest
request_api_version:7
correlation_id:3
client_id:adminclient-1
topics.0
  kafka2.CreatableTopic19q
  name:test-topic-0000000-oWpvdQM
  num_partitions:10
  replication_factor:3
  configs.0
    kafka2.CreatableTopicConfig19q
    name:min.insync.replicas
    value:2
timeout_ms:29995
validate_only:N

