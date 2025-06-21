#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.DescribeClusterRspV0kui 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.DescribeClusterRspV0kui timeout:10  memcheck:Y  exit_code:0  comment:DescribeClusterRspV0kui
acr.insert  atfdb.targs comptest:kapi.DescribeClusterRspV0kui args:"-decode -hex -rsp:- -apiver:23.60.0"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeClusterRspV0kui/100000.in  istuple:N  msg:"00 00 00 9b 00 00 00 17 00 00 00 00 00 00 00 00 09 64 65 76 2e 61 6b 2d 38 00 00 00 01 05 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeClusterRspV0kui/100010.in  istuple:N  msg:"00 01 15 64 65 76 2e 61 6b 2d 38 2e 6b 61 66 6b 61 2d 31 2e 65 78 74 00 00 04 07 00 00 00 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeClusterRspV0kui/100020.in  istuple:N  msg:"02 15 64 65 76 2e 61 6b 2d 38 2e 6b 61 66 6b 61 2d 32 2e 65 78 74 00 00 04 0f 00 00 00 00 00 03"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeClusterRspV0kui/100030.in  istuple:N  msg:"15 64 65 76 2e 61 6b 2d 38 2e 6b 61 66 6b 61 2d 33 2e 65 78 74 00 00 04 13 00 00 00 00 00 04 15"
acr.insert  atfdb.tmsg  tmsg:kapi.DescribeClusterRspV0kui/100040.in  istuple:N  msg:"64 65 76 2e 61 6b 2d 38 2e 6b 61 66 6b 61 2d 34 2e 65 78 74 00 00 04 17 00 00 00 00 1f a0 00"
EOF
atf_comp -capture kapi.DescribeClusterRspV0kui
atf_comp -run     kapi.DescribeClusterRspV0kui
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.DescribeClusterResponse  request_api_version:0  correlation_id:23  throttle_time_ms:0  error_code:0  endpoint_type:1  cluster_id:dev.ak-8  controller_id:1  brokers.0:"kafka2.DescribeClusterBroker60a  broker_id:1  host:dev.ak-8.kafka-1.ext  port:1031  is_fenced:N"  brokers.1:"kafka2.DescribeClusterBroker60a  broker_id:2  host:dev.ak-8.kafka-2.ext  port:1039  is_fenced:N"  brokers.2:"kafka2.DescribeClusterBroker60a  broker_id:3  host:dev.ak-8.kafka-3.ext  port:1043  is_fenced:N"  brokers.3:"kafka2.DescribeClusterBroker60a  broker_id:4  host:dev.ak-8.kafka-4.ext  port:1047  is_fenced:N"  cluster_authorized_operations:8096
# kafka2.DescribeClusterResponse
request_api_version:0
correlation_id:23
throttle_time_ms:0
error_code:0
endpoint_type:1
cluster_id:dev.ak-8
controller_id:1
brokers.0
  kafka2.DescribeClusterBroker60a
  broker_id:1
  host:dev.ak-8.kafka-1.ext
  port:1031
  is_fenced:N
brokers.1
  kafka2.DescribeClusterBroker60a
  broker_id:2
  host:dev.ak-8.kafka-2.ext
  port:1039
  is_fenced:N
brokers.2
  kafka2.DescribeClusterBroker60a
  broker_id:3
  host:dev.ak-8.kafka-3.ext
  port:1043
  is_fenced:N
brokers.3
  kafka2.DescribeClusterBroker60a
  broker_id:4
  host:dev.ak-8.kafka-4.ext
  port:1047
  is_fenced:N
cluster_authorized_operations:8096

