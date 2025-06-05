#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.InitProducerIdReqV4wrk 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.InitProducerIdReqV4wrk timeout:10  memcheck:Y  exit_code:0  comment:InitProducerIdReqV4wrk
acr.insert  atfdb.targs comptest:kapi.InitProducerIdReqV4wrk args:"-decode -hex -pretty -req:-"
acr.insert  atfdb.tmsg  tmsg:kapi.InitProducerIdReqV4wrk/100000.in  istuple:N  msg:"00 00 00 25 00 16 00 04 00 00 00 03 00 0a 70 72 6f 64 75 63 65 72 2d 31 00 00 7f ff ff ff ff ff"
acr.insert  atfdb.tmsg  tmsg:kapi.InitProducerIdReqV4wrk/100010.in  istuple:N  msg:"ff ff ff ff ff ff ff ff 00"
EOF
atf_comp -capture kapi.InitProducerIdReqV4wrk
atf_comp -run     kapi.InitProducerIdReqV4wrk
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.InitProducerIdRequest  request_api_version:4  correlation_id:3  client_id:producer-1  transaction_timeout_ms:2147483647  producer_id:-1  producer_epoch:-1  enable2_pc:N  keep_prepared_txn:N
# kafka2.InitProducerIdRequest
request_api_version:4
correlation_id:3
client_id:producer-1
transaction_timeout_ms:2147483647
producer_id:-1
producer_epoch:-1
enable2_pc:N
keep_prepared_txn:N

