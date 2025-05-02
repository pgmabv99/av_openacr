#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.MetadataRspV9rdp 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.MetadataRspV9rdp timeout:10  memcheck:Y  exit_code:0  comment:MetadataRspV9rdp
acr.insert  atfdb.targs comptest:kapi.MetadataRspV9rdp args:"-decode -hex -rsp:- -apiver:12.3.9"
acr.insert  atfdb.tmsg  tmsg:kapi.MetadataRspV9rdp/100000.in  istuple:N  msg:"00 00 00 f4 00 00 00 0c 00 00 00 00 00 05 00 00 00 01 15 64 65 76 2e 61 6b 2d 38 2e 6b 61 66 6b  "
acr.insert  atfdb.tmsg  tmsg:kapi.MetadataRspV9rdp/100010.in  istuple:N  msg:"61 2d 31 2e 65 78 74 00 00 04 07 00 00 00 00 00 02 15 64 65 76 2e 61 6b 2d 38 2e 6b 61 66 6b 61  "
acr.insert  atfdb.tmsg  tmsg:kapi.MetadataRspV9rdp/100020.in  istuple:N  msg:"2d 32 2e 65 78 74 00 00 04 0f 00 00 00 00 00 03 15 64 65 76 2e 61 6b 2d 38 2e 6b 61 66 6b 61 2d  "
acr.insert  atfdb.tmsg  tmsg:kapi.MetadataRspV9rdp/100030.in  istuple:N  msg:"33 2e 65 78 74 00 00 04 13 00 00 00 00 00 04 15 64 65 76 2e 61 6b 2d 38 2e 6b 61 66 6b 61 2d 34  "
acr.insert  atfdb.tmsg  tmsg:kapi.MetadataRspV9rdp/100040.in  istuple:N  msg:"2e 65 78 74 00 00 04 17 00 00 09 64 65 76 2e 61 6b 2d 38 00 00 00 01 02 00 00 04 61 76 31 00 04  "
acr.insert  atfdb.tmsg  tmsg:kapi.MetadataRspV9rdp/100050.in  istuple:N  msg:"00 00 00 00 00 02 00 00 00 01 00 00 00 00 02 00 00 00 01 02 00 00 00 01 01 00 00 00 00 00 00 01  "
acr.insert  atfdb.tmsg  tmsg:kapi.MetadataRspV9rdp/100060.in  istuple:N  msg:"00 00 00 04 00 00 00 00 02 00 00 00 04 02 00 00 00 04 01 00 00 00 00 00 00 00 00 00 00 03 00 00  "
acr.insert  atfdb.tmsg  tmsg:kapi.MetadataRspV9rdp/100070.in  istuple:N  msg:"00 00 02 00 00 00 03 02 00 00 00 03 01 00 80 00 00 00 00 80 00 00 00 00 "
EOF
atf_comp -capture kapi.MetadataRspV9rdp
atf_comp -run     kapi.MetadataRspV9rdp
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.MetadataResponse  request_api_version:9  correlation_id:12  throttle_time_ms:0  brokers.0:"kafka2.MetadataResponseBroker3a  node_id:1  host:dev.ak-8.kafka-1.ext  port:1031"  brokers.1:"kafka2.MetadataResponseBroker3a  node_id:2  host:dev.ak-8.kafka-2.ext  port:1039"  brokers.2:"kafka2.MetadataResponseBroker3a  node_id:3  host:dev.ak-8.kafka-3.ext  port:1043"  brokers.3:"kafka2.MetadataResponseBroker3a  node_id:4  host:dev.ak-8.kafka-4.ext  port:1047"  cluster_id:dev.ak-8  controller_id:1  topics.0:'kafka2.MetadataResponseTopic3a  error_code:0  name:av1  topic_id:00000000-0000-0000-0000-000000000000  is_internal:N  partitions.0:"kafka2.MetadataResponsePartition3a  error_code:0  partition_index:2  leader_id:1  leader_epoch:0  replica_nodes.0:1  isr_nodes.0:1"  partitions.1:"kafka2.MetadataResponsePartition3a  error_code:0  partition_index:1  leader_id:4  leader_epoch:0  replica_nodes.0:4  isr_nodes.0:4"  partitions.2:"kafka2.MetadataResponsePartition3a  error_code:0  partition_index:0  leader_id:3  leader_epoch:0  replica_nodes.0:3  isr_nodes.0:3"  topic_authorized_operations:-2147483648'  cluster_authorized_operations:-2147483648  error_code:0
