#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.MetadataReqV9wrk 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.MetadataReqV9wrk timeout:10  memcheck:Y  exit_code:0  comment:MetadataReqV9wrk
acr.insert  atfdb.targs comptest:kapi.MetadataReqV9wrk args:"-decode -hex -pretty -req:-"
acr.insert  atfdb.tmsg  tmsg:kapi.MetadataReqV9wrk/100000.in  istuple:N  msg:"00 00 00 20 00 03 00 09 00 00 00 01 00 10 72 65 64 70 61 6e 64 61 2d 63 6f 6e 73 6f 6c 65 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.MetadataReqV9wrk/100010.in  istuple:N  msg:"00 00 00 00"
EOF
atf_comp -capture kapi.MetadataReqV9wrk
atf_comp -run     kapi.MetadataReqV9wrk
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.MetadataRequest  request_api_version:9  correlation_id:1  client_id:redpanda-console  allow_auto_topic_creation:N  include_cluster_authorized_operations:N  include_topic_authorized_operations:N
# kafka2.MetadataRequest
request_api_version:9
correlation_id:1
client_id:redpanda-console
allow_auto_topic_creation:N
include_cluster_authorized_operations:N
include_topic_authorized_operations:N

