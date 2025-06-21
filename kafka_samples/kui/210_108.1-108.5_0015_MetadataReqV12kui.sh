#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.MetadataReqV12kui 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.MetadataReqV12kui timeout:10  memcheck:Y  exit_code:0  comment:MetadataReqV12kui
acr.insert  atfdb.targs comptest:kapi.MetadataReqV12kui args:"-decode -hex -req:-"
acr.insert  atfdb.tmsg  tmsg:kapi.MetadataReqV12kui/100000.in  istuple:N  msg:"00 00 00 2a 00 03 00 0c 00 00 00 0f 00 1b 6b 61 66 6b 61 2d 75 69 2d 61 64 6d 69 6e 2d 31 37 34"
acr.insert  atfdb.tmsg  tmsg:kapi.MetadataReqV12kui/100010.in  istuple:N  msg:"36 36 34 38 33 38 36 2d 31 00 00 01 00 00"
EOF
atf_comp -capture kapi.MetadataReqV12kui
atf_comp -run     kapi.MetadataReqV12kui
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.MetadataRequest  request_api_version:12  correlation_id:15  client_id:kafka-ui-admin-1746648386-1  allow_auto_topic_creation:Y  include_cluster_authorized_operations:N  include_topic_authorized_operations:N
# kafka2.MetadataRequest
request_api_version:12
correlation_id:15
client_id:kafka-ui-admin-1746648386-1
allow_auto_topic_creation:Y
include_cluster_authorized_operations:N
include_topic_authorized_operations:N

