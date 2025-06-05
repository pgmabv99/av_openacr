#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.OffsetCommitReqV8wrk 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.OffsetCommitReqV8wrk timeout:10  memcheck:Y  exit_code:0  comment:OffsetCommitReqV8wrk
acr.insert  atfdb.targs comptest:kapi.OffsetCommitReqV8wrk args:"-decode -hex -pretty -req:-"
acr.insert  atfdb.tmsg  tmsg:kapi.OffsetCommitReqV8wrk/100000.in  istuple:N  msg:"00 00 00 ab 00 08 00 08 00 00 00 25 00 1a 63 6f 6e 73 75 6d 65 72 2d 73 75 62 2d 30 30 30 2d 75"
acr.insert  atfdb.tmsg  tmsg:kapi.OffsetCommitReqV8wrk/100010.in  istuple:N  msg:"66 4d 4a 49 76 51 2d 31 00 10 73 75 62 2d 30 30 30 2d 75 66 4d 4a 49 76 51 00 00 00 01 40 63 6f"
acr.insert  atfdb.tmsg  tmsg:kapi.OffsetCommitReqV8wrk/100020.in  istuple:N  msg:"6e 73 75 6d 65 72 2d 73 75 62 2d 30 30 30 2d 75 66 4d 4a 49 76 51 2d 31 2d 39 66 33 32 62 34 39"
acr.insert  atfdb.tmsg  tmsg:kapi.OffsetCommitReqV8wrk/100030.in  istuple:N  msg:"66 2d 61 62 39 64 2d 34 39 61 64 2d 39 35 35 39 2d 38 36 33 65 31 35 61 62 37 32 36 30 00 02 1b"
acr.insert  atfdb.tmsg  tmsg:kapi.OffsetCommitReqV8wrk/100040.in  istuple:N  msg:"74 65 73 74 2d 74 6f 70 69 63 2d 30 30 30 30 30 30 30 2d 6f 57 70 76 64 51 4d 02 00 00 00 00 00"
acr.insert  atfdb.tmsg  tmsg:kapi.OffsetCommitReqV8wrk/100050.in  istuple:N  msg:"00 00 00 00 00 00 06 ff ff ff ff 01 00 00 00"
EOF
atf_comp -capture kapi.OffsetCommitReqV8wrk
atf_comp -run     kapi.OffsetCommitReqV8wrk
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.OffsetCommitRequest  request_api_version:8  correlation_id:37  client_id:consumer-sub-000-ufMJIvQ-1  group_id:sub-000-ufMJIvQ  generation_id_or_member_epoch:1  member_id:consumer-sub-000-ufMJIvQ-1-9f32b49f-ab9d-49ad-9559-863e15ab7260  retention_time_ms:-1  topics.0:"kafka2.OffsetCommitRequestTopic8q  name:test-topic-0000000-oWpvdQM  partitions.0:'kafka2.OffsetCommitRequestPartition8q  partition_index:0  committed_offset:6  committed_leader_epoch:-1  committed_metadata:\"\"'"
# kafka2.OffsetCommitRequest
request_api_version:8
correlation_id:37
client_id:consumer-sub-000-ufMJIvQ-1
group_id:sub-000-ufMJIvQ
generation_id_or_member_epoch:1
member_id:consumer-sub-000-ufMJIvQ-1-9f32b49f-ab9d-49ad-9559-863e15ab7260
retention_time_ms:-1
topics.0
  kafka2.OffsetCommitRequestTopic8q
  name:test-topic-0000000-oWpvdQM
  partitions.0
    kafka2.OffsetCommitRequestPartition8q
    partition_index:0
    committed_offset:6
    committed_leader_epoch:-1
    committed_metadata:""

