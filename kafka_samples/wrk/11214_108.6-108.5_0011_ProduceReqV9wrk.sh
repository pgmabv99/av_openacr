#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.ProduceReqV9wrk 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.ProduceReqV9wrk timeout:10  memcheck:Y  exit_code:0  comment:ProduceReqV9wrk
acr.insert  atfdb.targs comptest:kapi.ProduceReqV9wrk args:"-decode -hex -pretty -req:-"
acr.insert  atfdb.tmsg  tmsg:kapi.ProduceReqV9wrk/100000.in  istuple:N  msg:"00 00 00 92 00 00 00 09 00 00 00 0b 00 0a 70 72 6f 64 75 63 65 72 2d 31 00 00 ff ff 00 00 75 30"
acr.insert  atfdb.tmsg  tmsg:kapi.ProduceReqV9wrk/100010.in  istuple:N  msg:"02 1b 74 65 73 74 2d 74 6f 70 69 63 2d 30 30 30 30 30 30 30 2d 6f 57 70 76 64 51 4d 02 00 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.ProduceReqV9wrk/100020.in  istuple:N  msg:"01 52 00 00 00 00 00 00 00 00 00 00 00 45 ff ff ff ff 02 70 a5 86 71 00 00 00 00 00 00 00 00 01"
acr.insert  atfdb.tmsg  tmsg:kapi.ProduceReqV9wrk/100030.in  istuple:N  msg:"97 42 66 8b 39 00 00 01 97 42 66 8b 39 00 00 00 00 00 00 03 e8 00 00 00 00 00 00 00 00 00 01 26"
acr.insert  atfdb.tmsg  tmsg:kapi.ProduceReqV9wrk/100040.in  istuple:N  msg:"00 00 00 06 6b 65 79 14 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
EOF
atf_comp -capture kapi.ProduceReqV9wrk
atf_comp -run     kapi.ProduceReqV9wrk
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.ProduceRequest  request_api_version:9  correlation_id:11  client_id:producer-1  acks:-1  timeout_ms:30000  topic_data.0:"kafka2.TopicProduceData0q  name:test-topic-0000000-oWpvdQM  partition_data.0:'kafka2.PartitionProduceData0q  index:1  records:\"00 00 00 00 00 00 00 00 00 00 00 45 ff ff ff ff 02 70 a5 86 71 00 00 00 00 00 00 00 00 01 97 42 66 8b 39 00 00 01 97 42 66 8b 39 00 00 00 00 00 00 03 e8 00 00 00 00 00 00 00 00 00 01 26 00 00 00 06 6b 65 79 14 00 00 00 00 00 00 00 00 00 00 00\"'"
# kafka2.ProduceRequest
request_api_version:9
correlation_id:11
client_id:producer-1
acks:-1
timeout_ms:30000
topic_data.0
  kafka2.TopicProduceData0q
  name:test-topic-0000000-oWpvdQM
  partition_data.0
    kafka2.PartitionProduceData0q
    index:1
    records:"00 00 00 00 00 00 00 00 00 00 00 45 ff ff ff ff 02 70 a5 86 71 00 00 00 00 00 00 00 00 01 97 42 66 8b 39 00 00 01 97 42 66 8b 39 00 00 00 00 00 00 03 e8 00 00 00 00 00 00 00 00 00 01 26 00 00 00 06 6b 65 79 14 00 00 00 00 00 00 00 00 00 00 00"

