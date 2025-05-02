#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.FetchReqV11rdp 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.FetchReqV11rdp timeout:10  memcheck:Y  exit_code:0  comment:FetchReqV11rdp
acr.insert  atfdb.targs comptest:kapi.FetchReqV11rdp args:"-decode -hex -req:- "
acr.insert  atfdb.tmsg  tmsg:kapi.FetchReqV11rdp/100000.in  istuple:N  msg:"00 00 00 3d 00 01 00 0b 00 00 00 00 00 10 72 65 64 70 61 6e 64 61 2d 63 6f 6e 73 6f 6c 65 ff ff  "
acr.insert  atfdb.tmsg  tmsg:kapi.FetchReqV11rdp/100010.in  istuple:N  msg:"ff ff 00 00 00 01 00 00 00 01 00 00 00 01 00 1b 52 64 42 ff ff ff ff 00 00 00 00 00 00 00 00 00  "
acr.insert  atfdb.tmsg  tmsg:kapi.FetchReqV11rdp/100020.in  istuple:N  msg:"00 "
EOF
atf_comp -capture kapi.FetchReqV11rdp
atf_comp -run     kapi.FetchReqV11rdp
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.FetchRequest  request_api_version:11  correlation_id:0  client_id:redpanda-console  replica_id:-1  replica_state:"kafka2.ReplicaState1q  replica_id:-1  replica_epoch:-1"  max_wait_ms:1  min_bytes:1  max_bytes:1  isolation_level:0  session_id:458384450  session_epoch:-1  rack_id:""
