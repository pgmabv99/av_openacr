#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.DescribeClusterReqV0kui 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.DescribeClusterReqV0kui timeout:10  memcheck:Y  exit_code:0  comment:DescribeClusterReqV0kui
acr.insert  atfdb.targs comptest:kapi.DescribeClusterReqV0kui args:"-decode -hex -req:-"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeClusterReqV0kui/100000.in  istuple:N  msg:"00 00 00 28 00 3c 00 00 00 00 00 17 00 1b 6b 61 66 6b 61 2d 75 69 2d 61 64 6d 69 6e 2d 31 37 34"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeClusterReqV0kui/100010.in  istuple:N  msg:"36 36 34 38 32 32 37 2d 31 00 01 00"
EOF
atf_comp -capture kapi.DescribeClusterReqV0kui
atf_comp -run     kapi.DescribeClusterReqV0kui
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.DescribeClusterRequest  request_api_version:0  correlation_id:23  client_id:kafka-ui-admin-1746648227-1  include_cluster_authorized_operations:Y  endpoint_type:1  include_fenced_brokers:N
# kafka2.DescribeClusterRequest
request_api_version:0
correlation_id:23
client_id:kafka-ui-admin-1746648227-1
include_cluster_authorized_operations:Y
endpoint_type:1
include_fenced_brokers:N

