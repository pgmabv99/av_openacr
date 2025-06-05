#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.MetadataReqV12wrk 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.MetadataReqV12wrk timeout:10  memcheck:Y  exit_code:0  comment:MetadataReqV12wrk
acr.insert  atfdb.targs comptest:kapi.MetadataReqV12wrk args:"-decode -hex -pretty -req:-"
acr.insert  atfdb.tmsg  tmsg:kapi.MetadataReqV12wrk/100000.in  istuple:N  msg:"00 00 00 55 00 03 00 0c 00 00 00 02 00 1a 63 6f 6e 73 75 6d 65 72 2d 73 75 62 2d 30 30 30 2d 75"
acr.insert  atfdb.tmsg  tmsg:kapi.MetadataReqV12wrk/100010.in  istuple:N  msg:"66 4d 4a 49 76 51 2d 31 00 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 1b 74 65 73 74 2d"
acr.insert  atfdb.tmsg  tmsg:kapi.MetadataReqV12wrk/100020.in  istuple:N  msg:"74 6f 70 69 63 2d 30 30 30 30 30 30 30 2d 6f 57 70 76 64 51 4d 00 01 00 00"
EOF
atf_comp -capture kapi.MetadataReqV12wrk
atf_comp -run     kapi.MetadataReqV12wrk
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.MetadataRequest  request_api_version:12  correlation_id:2  client_id:consumer-sub-000-ufMJIvQ-1  topics.0:"kafka2.MetadataRequestTopic3q  topic_id:00000000-0000-0000-0000-000000000000  name:test-topic-0000000-oWpvdQM"  allow_auto_topic_creation:Y  include_cluster_authorized_operations:N  include_topic_authorized_operations:N
# kafka2.MetadataRequest
request_api_version:12
correlation_id:2
client_id:consumer-sub-000-ufMJIvQ-1
topics.0
  kafka2.MetadataRequestTopic3q
  topic_id:00000000-0000-0000-0000-000000000000
  name:test-topic-0000000-oWpvdQM
allow_auto_topic_creation:Y
include_cluster_authorized_operations:N
include_topic_authorized_operations:N

