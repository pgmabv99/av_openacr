#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.SyncGroupReqV5wrk 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.SyncGroupReqV5wrk timeout:10  memcheck:Y  exit_code:0  comment:SyncGroupReqV5wrk
acr.insert  atfdb.targs comptest:kapi.SyncGroupReqV5wrk args:"-decode -hex -pretty -req:-"
acr.insert  atfdb.tmsg  tmsg:kapi.SyncGroupReqV5wrk/100000.in  istuple:N  msg:"00 00 01 1f 00 0e 00 05 00 00 00 0d 00 1a 63 6f 6e 73 75 6d 65 72 2d 73 75 62 2d 30 30 30 2d 75"
acr.insert  atfdb.tmsg  tmsg:kapi.SyncGroupReqV5wrk/100010.in  istuple:N  msg:"66 4d 4a 49 76 51 2d 31 00 10 73 75 62 2d 30 30 30 2d 75 66 4d 4a 49 76 51 00 00 00 01 40 63 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.SyncGroupReqV5wrk/100020.in  istuple:N  msg:"6e 73 75 6d 65 72 2d 73 75 62 2d 30 30 30 2d 75 66 4d 4a 49 76 51 2d 31 2d 39 66 33 32 62 34 39"
acr.insert  atfdb.tmsg  tmsg:kapi.SyncGroupReqV5wrk/100030.in  istuple:N  msg:"66 2d 61 62 39 64 2d 34 39 61 64 2d 39 35 35 39 2d 38 36 33 65 31 35 61 62 37 32 36 30 00 09 63"
acr.insert  atfdb.tmsg  tmsg:kapi.SyncGroupReqV5wrk/100040.in  istuple:N  msg:"6f 6e 73 75 6d 65 72 06 72 61 6e 67 65 02 40 63 6f 6e 73 75 6d 65 72 2d 73 75 62 2d 30 30 30 2d"
acr.insert  atfdb.tmsg  tmsg:kapi.SyncGroupReqV5wrk/100050.in  istuple:N  msg:"75 66 4d 4a 49 76 51 2d 31 2d 39 66 33 32 62 34 39 66 2d 61 62 39 64 2d 34 39 61 64 2d 39 35 35"
acr.insert  atfdb.tmsg  tmsg:kapi.SyncGroupReqV5wrk/100060.in  istuple:N  msg:"39 2d 38 36 33 65 31 35 61 62 37 32 36 30 53 00 03 00 00 00 01 00 1a 74 65 73 74 2d 74 6f 70 69"
acr.insert  atfdb.tmsg  tmsg:kapi.SyncGroupReqV5wrk/100070.in  istuple:N  msg:"63 2d 30 30 30 30 30 30 30 2d 6f 57 70 76 64 51 4d 00 00 00 0a 00 00 00 00 00 00 00 01 00 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.SyncGroupReqV5wrk/100080.in  istuple:N  msg:"02 00 00 00 03 00 00 00 04 00 00 00 05 00 00 00 06 00 00 00 07 00 00 00 08 00 00 00 09 ff ff ff"
acr.insert  atfdb.tmsg  tmsg:kapi.SyncGroupReqV5wrk/100090.in  istuple:N  msg:"ff 00 00"
EOF
atf_comp -capture kapi.SyncGroupReqV5wrk
atf_comp -run     kapi.SyncGroupReqV5wrk
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.SyncGroupRequest  request_api_version:5  correlation_id:13  client_id:consumer-sub-000-ufMJIvQ-1  group_id:sub-000-ufMJIvQ  generation_id:1  member_id:consumer-sub-000-ufMJIvQ-1-9f32b49f-ab9d-49ad-9559-863e15ab7260  protocol_type:consumer  protocol_name:range  assignments.0:'kafka2.SyncGroupRequestAssignment14q  member_id:consumer-sub-000-ufMJIvQ-1-9f32b49f-ab9d-49ad-9559-863e15ab7260  assignment:"00 03 00 00 00 01 00 1a 74 65 73 74 2d 74 6f 70 69 63 2d 30 30 30 30 30 30 30 2d 6f 57 70 76 64 51 4d 00 00 00 0a 00 00 00 00 00 00 00 01 00 00 00 02 00 00 00 03 00 00 00 04 00 00 00 05 00 00 00 06 00 00 00 07 00 00 00 08 00 00 00 09 ff ff ff ff"'
# kafka2.SyncGroupRequest
request_api_version:5
correlation_id:13
client_id:consumer-sub-000-ufMJIvQ-1
group_id:sub-000-ufMJIvQ
generation_id:1
member_id:consumer-sub-000-ufMJIvQ-1-9f32b49f-ab9d-49ad-9559-863e15ab7260
protocol_type:consumer
protocol_name:range
assignments.0
  kafka2.SyncGroupRequestAssignment14q
  member_id:consumer-sub-000-ufMJIvQ-1-9f32b49f-ab9d-49ad-9559-863e15ab7260
  assignment:"00 03 00 00 00 01 00 1a 74 65 73 74 2d 74 6f 70 69 63 2d 30 30 30 30 30 30 30 2d 6f 57 70 76 64 51 4d 00 00 00 0a 00 00 00 00 00 00 00 01 00 00 00 02 00 00 00 03 00 00 00 04 00 00 00 05 00 00 00 06 00 00 00 07 00 00 00 08 00 00 00 09 ff ff ff ff"

