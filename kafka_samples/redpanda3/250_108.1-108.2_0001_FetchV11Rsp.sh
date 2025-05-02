#!/bin/bash

cd ~/arnd
acr -merge -write <<EOF
acr.delete atfdb.comptest comptest:kapi.FetchRspV11rdp 
EOF
acr -merge -write <<EOF
acr.insert  atfdb.comptest comptest:kapi.FetchRspV11rdp timeout:10  memcheck:Y  exit_code:0  comment:FetchRspV11rdp
acr.insert  atfdb.targs comptest:kapi.FetchRspV11rdp args:"-decode -hex -rsp:- -apiver:1.1.11"
acr.insert  atfdb.tmsg  tmsg:kapi.FetchRspV11rdp/100000.in  istuple:N  msg:"00 00 00 45 00 00 00 01 00 00 00 00 00 00 08 c3 f8 40 00 00 00 01 00 03 61 76 31 00 00 00 01 00  "
acr.insert  atfdb.tmsg  tmsg:kapi.FetchRspV11rdp/100010.in  istuple:N  msg:"00 00 02 00 01 ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  "
acr.insert  atfdb.tmsg  tmsg:kapi.FetchRspV11rdp/100020.in  istuple:N  msg:"ff ff ff ff ff 00 00 00 00 "
EOF
atf_comp -capture kapi.FetchRspV11rdp
atf_comp -run     kapi.FetchRspV11rdp
retcode=$?; echo "Return code: $retcode"; exit $retcode
# kafka2.FetchResponse  request_api_version:11  correlation_id:1  throttle_time_ms:0  error_code:0  session_id:147060800  responses.0:'kafka2.FetchableTopicResponse1a  topic:av1  topic_id:00000000-0000-0000-0000-000000000000  partitions.0:\'kafka2.PartitionData1a  partition_index:2  error_code:1  high_watermark:-1  last_stable_offset:-1  log_start_offset:-1  diverging_epoch:"kafka2.EpochEndOffset1a  epoch:-1  end_offset:-1"  current_leader:"kafka2.LeaderIdAndEpoch1a  leader_id:-1  leader_epoch:-1"  snapshot_id:"kafka2.SnapshotId1a  end_offset:-1  epoch:-1"  preferred_read_replica:-1  records:""\''
