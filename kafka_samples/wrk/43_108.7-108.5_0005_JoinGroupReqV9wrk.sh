#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.JoinGroupReqV9wrk 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.JoinGroupReqV9wrk timeout:10  memcheck:Y  exit_code:0  comment:JoinGroupReqV9wrk
acr.insert  atfdb.targs comptest:kapi.JoinGroupReqV9wrk args:"-decode -hex -pretty -req:-"
acr.insert  atfdb.tmsg  tmsg:kapi.JoinGroupReqV9wrk/100000.in  istuple:N  msg:"00 00 00 cc 00 0b 00 09 00 00 00 05 00 1a 63 6f 6e 73 75 6d 65 72 2d 73 75 62 2d 30 30 30 2d 75"
acr.insert  atfdb.tmsg  tmsg:kapi.JoinGroupReqV9wrk/100010.in  istuple:N  msg:"66 4d 4a 49 76 51 2d 31 00 10 73 75 62 2d 30 30 30 2d 75 66 4d 4a 49 76 51 00 00 af c8 00 04 93"
acr.insert  atfdb.tmsg  tmsg:kapi.JoinGroupReqV9wrk/100020.in  istuple:N  msg:"e0 01 00 09 63 6f 6e 73 75 6d 65 72 03 06 72 61 6e 67 65 31 00 03 00 00 00 01 00 1a 74 65 73 74"
acr.insert  atfdb.tmsg  tmsg:kapi.JoinGroupReqV9wrk/100030.in  istuple:N  msg:"2d 74 6f 70 69 63 2d 30 30 30 30 30 30 30 2d 6f 57 70 76 64 51 4d ff ff ff ff 00 00 00 00 ff ff"
acr.insert  atfdb.tmsg  tmsg:kapi.JoinGroupReqV9wrk/100040.in  istuple:N  msg:"ff ff ff ff 00 13 63 6f 6f 70 65 72 61 74 69 76 65 2d 73 74 69 63 6b 79 35 00 03 00 00 00 01 00"
acr.insert  atfdb.tmsg  tmsg:kapi.JoinGroupReqV9wrk/100050.in  istuple:N  msg:"1a 74 65 73 74 2d 74 6f 70 69 63 2d 30 30 30 30 30 30 30 2d 6f 57 70 76 64 51 4d 00 00 00 04 ff"
acr.insert  atfdb.tmsg  tmsg:kapi.JoinGroupReqV9wrk/100060.in  istuple:N  msg:"ff ff ff 00 00 00 00 ff ff ff ff ff ff 00 01 00"
EOF
atf_comp -capture kapi.JoinGroupReqV9wrk
atf_comp -run     kapi.JoinGroupReqV9wrk
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.JoinGroupRequest  request_api_version:9  correlation_id:5  client_id:consumer-sub-000-ufMJIvQ-1  group_id:sub-000-ufMJIvQ  session_timeout_ms:45000  rebalance_timeout_ms:300000  member_id:""  protocol_type:consumer  protocols.0:'kafka2.JoinGroupRequestProtocol11q  name:range  metadata:"00 03 00 00 00 01 00 1a 74 65 73 74 2d 74 6f 70 69 63 2d 30 30 30 30 30 30 30 2d 6f 57 70 76 64 51 4d ff ff ff ff 00 00 00 00 ff ff ff ff ff ff"'  protocols.1:'kafka2.JoinGroupRequestProtocol11q  name:cooperative-sticky  metadata:"00 03 00 00 00 01 00 1a 74 65 73 74 2d 74 6f 70 69 63 2d 30 30 30 30 30 30 30 2d 6f 57 70 76 64 51 4d 00 00 00 04 ff ff ff ff 00 00 00 00 ff ff ff ff ff ff"'  reason:""
# kafka2.JoinGroupRequest
request_api_version:9
correlation_id:5
client_id:consumer-sub-000-ufMJIvQ-1
group_id:sub-000-ufMJIvQ
session_timeout_ms:45000
rebalance_timeout_ms:300000
member_id:""
protocol_type:consumer
protocols.0
  kafka2.JoinGroupRequestProtocol11q
  name:range
  metadata:"00 03 00 00 00 01 00 1a 74 65 73 74 2d 74 6f 70 69 63 2d 30 30 30 30 30 30 30 2d 6f 57 70 76 64 51 4d ff ff ff ff 00 00 00 00 ff ff ff ff ff ff"
protocols.1
  kafka2.JoinGroupRequestProtocol11q
  name:cooperative-sticky
  metadata:"00 03 00 00 00 01 00 1a 74 65 73 74 2d 74 6f 70 69 63 2d 30 30 30 30 30 30 30 2d 6f 57 70 76 64 51 4d 00 00 00 04 ff ff ff ff 00 00 00 00 ff ff ff ff ff ff"
reason:""

