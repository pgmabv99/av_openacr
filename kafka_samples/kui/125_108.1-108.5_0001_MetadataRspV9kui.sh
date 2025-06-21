#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.MetadataRspV9kui 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.MetadataRspV9kui timeout:10  memcheck:Y  exit_code:0  comment:MetadataRspV9kui
acr.insert  atfdb.targs comptest:kapi.MetadataRspV9kui args:"-decode -hex -rsp:- -apiver:1.3.9"
acr.insert  atfdb.tmsg  tmsg:kapi.MetadataRspV9kui/100000.in  istuple:N  msg:"00 00 00 99 00 00 00 01 00 00 00 00 00 05 00 00 00 01 15 64 65 76 2e 61 6b 2d 38 2e 6b 61 66 6b"
acr.insert  atfdb.tmsg  tmsg:kapi.MetadataRspV9kui/100010.in  istuple:N  msg:"61 2d 31 2e 65 78 74 00 00 04 07 00 00 00 00 00 02 15 64 65 76 2e 61 6b 2d 38 2e 6b 61 66 6b 61"
acr.insert  atfdb.tmsg  tmsg:kapi.MetadataRspV9kui/100020.in  istuple:N  msg:"2d 32 2e 65 78 74 00 00 04 0f 00 00 00 00 00 03 15 64 65 76 2e 61 6b 2d 38 2e 6b 61 66 6b 61 2d"
acr.insert  atfdb.tmsg  tmsg:kapi.MetadataRspV9kui/100030.in  istuple:N  msg:"33 2e 65 78 74 00 00 04 13 00 00 00 00 00 04 15 64 65 76 2e 61 6b 2d 38 2e 6b 61 66 6b 61 2d 34"
acr.insert  atfdb.tmsg  tmsg:kapi.MetadataRspV9kui/100040.in  istuple:N  msg:"2e 65 78 74 00 00 04 17 00 00 09 64 65 76 2e 61 6b 2d 38 00 00 00 04 01 80 00 00 00 00"
EOF
atf_comp -capture kapi.MetadataRspV9kui
atf_comp -run     kapi.MetadataRspV9kui
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.MetadataResponse  request_api_version:9  correlation_id:1  throttle_time_ms:0  brokers.0:"kafka2.MetadataResponseBroker3a  node_id:1  host:dev.ak-8.kafka-1.ext  port:1031"  brokers.1:"kafka2.MetadataResponseBroker3a  node_id:2  host:dev.ak-8.kafka-2.ext  port:1039"  brokers.2:"kafka2.MetadataResponseBroker3a  node_id:3  host:dev.ak-8.kafka-3.ext  port:1043"  brokers.3:"kafka2.MetadataResponseBroker3a  node_id:4  host:dev.ak-8.kafka-4.ext  port:1047"  cluster_id:dev.ak-8  controller_id:4  cluster_authorized_operations:-2147483648  error_code:0
# kafka2.MetadataResponse
request_api_version:9
correlation_id:1
throttle_time_ms:0
brokers.0
  kafka2.MetadataResponseBroker3a
  node_id:1
  host:dev.ak-8.kafka-1.ext
  port:1031
brokers.1
  kafka2.MetadataResponseBroker3a
  node_id:2
  host:dev.ak-8.kafka-2.ext
  port:1039
brokers.2
  kafka2.MetadataResponseBroker3a
  node_id:3
  host:dev.ak-8.kafka-3.ext
  port:1043
brokers.3
  kafka2.MetadataResponseBroker3a
  node_id:4
  host:dev.ak-8.kafka-4.ext
  port:1047
cluster_id:dev.ak-8
controller_id:4
cluster_authorized_operations:-2147483648
error_code:0

