#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.InitProducerIdRspV3rdp 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.InitProducerIdRspV3rdp timeout:10  memcheck:Y  exit_code:0  comment:InitProducerIdRspV3rdp
acr.insert  atfdb.targs comptest:kapi.InitProducerIdRspV3rdp args:"-decode -hex -rsp:- -apiver:1.22.3"
acr.insert  atfdb.tmsg  tmsg:kapi.InitProducerIdRspV3rdp/100000.in  istuple:N  msg:"00 00 00 16 00 00 00 01 00 00 00 00 00 00 0e ff ff ff ff ff ff ff ff ff ff 00 "
EOF
atf_comp -capture kapi.InitProducerIdRspV3rdp
atf_comp -run     kapi.InitProducerIdRspV3rdp
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.InitProducerIdResponse  request_api_version:3  correlation_id:1  throttle_time_ms:0  error_code:14  producer_id:-1  producer_epoch:-1  ongoing_txn_producer_id:-1  ongoing_txn_producer_epoch:-1
