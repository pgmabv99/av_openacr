#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.InitProducerIdRspV4wrk 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.InitProducerIdRspV4wrk timeout:10  memcheck:Y  exit_code:0  comment:InitProducerIdRspV4wrk
acr.insert  atfdb.targs comptest:kapi.InitProducerIdRspV4wrk args:"-decode -hex -pretty -rsp:- -apiver:3.22.4"
acr.insert  atfdb.tmsg  tmsg:kapi.InitProducerIdRspV4wrk/100000.in  istuple:N  msg:"00 00 00 16 00 00 00 03 00 00 00 00 00 00 0e ff ff ff ff ff ff ff ff ff ff 00"
EOF
atf_comp -capture kapi.InitProducerIdRspV4wrk
atf_comp -run     kapi.InitProducerIdRspV4wrk
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.InitProducerIdResponse  request_api_version:4  correlation_id:3  throttle_time_ms:0  error_code:14  producer_id:-1  producer_epoch:-1  ongoing_txn_producer_id:-1  ongoing_txn_producer_epoch:-1
# kafka2.InitProducerIdResponse
request_api_version:4
correlation_id:3
throttle_time_ms:0
error_code:14
producer_id:-1
producer_epoch:-1
ongoing_txn_producer_id:-1
ongoing_txn_producer_epoch:-1

