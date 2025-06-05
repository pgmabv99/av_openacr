#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.MetadataReqV12wrk 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.MetadataReqV12wrk timeout:10  memcheck:Y  exit_code:0  comment:MetadataReqV12wrk
acr.insert  atfdb.targs comptest:kapi.MetadataReqV12wrk args:"-decode -hex -pretty -req:-"
acr.insert  atfdb.tmsg  tmsg:kapi.MetadataReqV12wrk/100000.in  istuple:N  msg:"00 00 00 2a 00 03 00 0c 00 00 00 01 00 1b 6b 61 66 6b 61 2d 75 69 2d 61 64 6d 69 6e 2d 31 37 34"
acr.insert  atfdb.tmsg  tmsg:kapi.MetadataReqV12wrk/100010.in  istuple:N  msg:"39 31 36 35 36 38 35 2d 31 00 01 01 00 00"
EOF
atf_comp -capture kapi.MetadataReqV12wrk
atf_comp -run     kapi.MetadataReqV12wrk
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.MetadataRequest  request_api_version:12  correlation_id:1  client_id:kafka-ui-admin-1749165685-1  allow_auto_topic_creation:Y  include_cluster_authorized_operations:N  include_topic_authorized_operations:N
# kafka2.MetadataRequest
request_api_version:12
correlation_id:1
client_id:kafka-ui-admin-1749165685-1
allow_auto_topic_creation:Y
include_cluster_authorized_operations:N
include_topic_authorized_operations:N

