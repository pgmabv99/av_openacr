#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.InitProducerIdReqV3rdp 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.InitProducerIdReqV3rdp timeout:10  memcheck:Y  exit_code:0  comment:InitProducerIdReqV3rdp
acr.insert  atfdb.targs comptest:kapi.InitProducerIdReqV3rdp args:"-decode -hex -req:- "
acr.insert  atfdb.tmsg  tmsg:kapi.InitProducerIdReqV3rdp/100000.in  istuple:N  msg:"00 00 00 2b 00 16 00 03 00 00 00 01 00 10 72 65 64 70 61 6e 64 61 2d 63 6f 6e 73 6f 6c 65 00 00  "
acr.insert  atfdb.tmsg  tmsg:kapi.InitProducerIdReqV3rdp/100010.in  istuple:N  msg:"00 00 00 00 ff ff ff ff ff ff ff ff ff ff 00 "
EOF
atf_comp -capture kapi.InitProducerIdReqV3rdp
atf_comp -run     kapi.InitProducerIdReqV3rdp
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.InitProducerIdRequest  request_api_version:3  correlation_id:1  client_id:redpanda-console  transaction_timeout_ms:0  producer_id:-1  producer_epoch:-1  enable2_pc:N  keep_prepared_txn:N
