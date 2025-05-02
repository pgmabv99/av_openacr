#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.ProduceReqV8rdp 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.ProduceReqV8rdp timeout:10  memcheck:Y  exit_code:0  comment:ProduceReqV8rdp
acr.insert  atfdb.targs comptest:kapi.ProduceReqV8rdp args:"-decode -hex -req:- "
acr.insert  atfdb.tmsg  tmsg:kapi.ProduceReqV8rdp/100000.in  istuple:N  msg:"00 00 00 87 00 00 00 08 00 00 00 01 00 10 72 65 64 70 61 6e 64 61 2d 63 6f 6e 73 6f 6c 65 ff ff  "
acr.insert  atfdb.tmsg  tmsg:kapi.ProduceReqV8rdp/100010.in  istuple:N  msg:"ff ff 00 00 27 10 00 00 00 01 00 03 61 76 31 00 00 00 01 00 00 00 02 00 00 00 50 00 00 00 00 00  "
acr.insert  atfdb.tmsg  tmsg:kapi.ProduceReqV8rdp/100020.in  istuple:N  msg:"00 00 00 00 00 00 44 ff ff ff ff 02 71 17 f2 2c 00 00 00 00 00 00 00 00 01 96 92 22 8f 6b 00 00  "
acr.insert  atfdb.tmsg  tmsg:kapi.ProduceReqV8rdp/100030.in  istuple:N  msg:"01 96 92 22 8f 6b 00 00 00 00 00 00 03 e8 00 00 00 00 00 00 00 00 00 01 24 00 00 00 04 6b 31 04  "
acr.insert  atfdb.tmsg  tmsg:kapi.ProduceReqV8rdp/100040.in  istuple:N  msg:"76 31 02 06 68 6b 31 06 68 76 31 "
EOF
atf_comp -capture kapi.ProduceReqV8rdp
atf_comp -run     kapi.ProduceReqV8rdp
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.ProduceRequest  request_api_version:8  correlation_id:1  client_id:redpanda-console  acks:-1  timeout_ms:10000  topic_data.0:"kafka2.TopicProduceData0q  name:av1  partition_data.0:'kafka2.PartitionProduceData0q  index:2  records:\"00 00 00 00 00 00 00 00 00 00 00 44 ff ff ff ff 02 71 17 f2 2c 00 00 00 00 00 00 00 00 01 96 92 22 8f 6b 00 00 01 96 92 22 8f 6b 00 00 00 00 00 00 03 e8 00 00 00 00 00 00 00 00 00 01 24 00 00 00 04 6b 31 04 76 31 02 06 68 6b 31 06 68 76 31\"'"
