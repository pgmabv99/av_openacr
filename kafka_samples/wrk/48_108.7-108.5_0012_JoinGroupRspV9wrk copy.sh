#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.JoinGroupRspV9wrk 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.JoinGroupRspV9wrk timeout:10  memcheck:Y  exit_code:0  comment:JoinGroupRspV9wrk
acr.insert  atfdb.targs comptest:kapi.JoinGroupRspV9wrk args:"-decode -hex -pretty -rsp:- -apiver:12.11.9"
acr.insert  atfdb.tmsg  tmsg:kapi.JoinGroupRspV9wrk/100000.in  istuple:N  msg:"00 00 01 14 00 00 00 0c 00 00 00 00 00 00 00 00 00 00 01 09 63 6f 6e 73 75 6d 65 72 06 72 61 6e"
acr.insert  atfdb.tmsg  tmsg:kapi.JoinGroupRspV9wrk/100010.in  istuple:N  msg:"67 65 40 63 6f 6e 73 75 6d 65 72 2d 73 75 62 2d 30 30 30 2d 75 66 4d 4a 49 76 51 2d 31 2d 39 66"
acr.insert  atfdb.tmsg  tmsg:kapi.JoinGroupRspV9wrk/100020.in  istuple:N  msg:"33 32 62 34 39 66 2d 61 62 39 64 2d 34 39 61 64 2d 39 35 35 39 2d 38 36 33 65 31 35 61 62 37 32"
acr.insert  atfdb.tmsg  tmsg:kapi.JoinGroupRspV9wrk/100030.in  istuple:N  msg:"36 30 00 40 63 6f 6e 73 75 6d 65 72 2d 73 75 62 2d 30 30 30 2d 75 66 4d 4a 49 76 51 2d 31 2d 39"
acr.insert  atfdb.tmsg  tmsg:kapi.JoinGroupRspV9wrk/100040.in  istuple:N  msg:"66 33 32 62 34 39 66 2d 61 62 39 64 2d 34 39 61 64 2d 39 35 35 39 2d 38 36 33 65 31 35 61 62 37"
acr.insert  atfdb.tmsg  tmsg:kapi.JoinGroupRspV9wrk/100050.in  istuple:N  msg:"32 36 30 02 40 63 6f 6e 73 75 6d 65 72 2d 73 75 62 2d 30 30 30 2d 75 66 4d 4a 49 76 51 2d 31 2d"
acr.insert  atfdb.tmsg  tmsg:kapi.JoinGroupRspV9wrk/100060.in  istuple:N  msg:"39 66 33 32 62 34 39 66 2d 61 62 39 64 2d 34 39 61 64 2d 39 35 35 39 2d 38 36 33 65 31 35 61 62"
acr.insert  atfdb.tmsg  tmsg:kapi.JoinGroupRspV9wrk/100070.in  istuple:N  msg:"37 32 36 30 00 31 00 03 00 00 00 01 00 1a 74 65 73 74 2d 74 6f 70 69 63 2d 30 30 30 30 30 30 30"
acr.insert  atfdb.tmsg  tmsg:kapi.JoinGroupRspV9wrk/100080.in  istuple:N  msg:"2d 6f 57 70 76 64 51 4d ff ff ff ff 00 00 00 00 ff ff ff ff ff ff 00 00"
EOF
atf_comp -capture kapi.JoinGroupRspV9wrk
atf_comp -run     kapi.JoinGroupRspV9wrk
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.JoinGroupResponse  request_api_version:9  correlation_id:12  throttle_time_ms:0  error_code:0  generation_id:1  protocol_type:consumer  protocol_name:range  leader:consumer-sub-000-ufMJIvQ-1-9f32b49f-ab9d-49ad-9559-863e15ab7260  skip_assignment:N  member_id:consumer-sub-000-ufMJIvQ-1-9f32b49f-ab9d-49ad-9559-863e15ab7260  members.0:'kafka2.JoinGroupResponseMember11a  member_id:consumer-sub-000-ufMJIvQ-1-9f32b49f-ab9d-49ad-9559-863e15ab7260  metadata:"00 03 00 00 00 01 00 1a 74 65 73 74 2d 74 6f 70 69 63 2d 30 30 30 30 30 30 30 2d 6f 57 70 76 64 51 4d ff ff ff ff 00 00 00 00 ff ff ff ff ff ff"'
# kafka2.JoinGroupResponse
request_api_version:9
correlation_id:12
throttle_time_ms:0
error_code:0
generation_id:1
protocol_type:consumer
protocol_name:range
leader:consumer-sub-000-ufMJIvQ-1-9f32b49f-ab9d-49ad-9559-863e15ab7260
skip_assignment:N
member_id:consumer-sub-000-ufMJIvQ-1-9f32b49f-ab9d-49ad-9559-863e15ab7260
members.0
  kafka2.JoinGroupResponseMember11a
  member_id:consumer-sub-000-ufMJIvQ-1-9f32b49f-ab9d-49ad-9559-863e15ab7260
  metadata:"00 03 00 00 00 01 00 1a 74 65 73 74 2d 74 6f 70 69 63 2d 30 30 30 30 30 30 30 2d 6f 57 70 76 64 51 4d ff ff ff ff 00 00 00 00 ff ff ff ff ff ff"

