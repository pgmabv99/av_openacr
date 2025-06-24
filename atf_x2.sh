#!/bin/bash




# cat <<'EOF' > /tmp/atf_x2_metadata
# x2.ProcStartMsg  proc:x2  cmd:"$bindir/x2sup -i -in:$tempdir/data -bindir:$bindir -random_ports"
# x2.ProcReadMsg  proc:x2  until:READY_FOR_TEST
# x2.ProcStartMsg  proc:kcat-md  cmd:"kcat -b 127.0.0.1:$kafkaport -L -t test1 -X allow.auto.create.topics=false"
# x2.ProcReadMsg  proc:kcat-md
# x2.ProcStartMsg  proc:kcat-md  cmd:"kcat -b 127.0.0.1:$kafkaport -L"
# x2.ProcReadMsg  proc:kcat-md
# x2.ProcStartMsg  proc:kcat-md  cmd:"kcat -b 127.0.0.1:$kafkaport -L -t test2 -X allow.auto.create.topics=true"
# x2.ProcReadMsg  proc:kcat-md
# x2.ProcStartMsg  proc:kcat-pub  cmd:"kcat -b 127.0.0.1:$kafkaport -P -t test3 -X allow.auto.create.topics=false -X topic.metadata.propagation.max.ms=10"
# x2.ProcMsg  proc:kcat-pub  payload:"dummy"
# x2.ProcEofMsg  proc:kcat-pub
# x2.ProcReadMsg  proc:kcat-pub
# x2.ProcStartMsg  proc:kcat-pub  cmd:"kcat -b 127.0.0.1:$kafkaport -P -t test4 -X allow.auto.create.topics=true"
# x2.ProcMsg  proc:kcat-pub  payload:"SINE IUDICIO EXPERIENTIA INFRUCTUOSA"
# x2.ProcEofMsg  proc:kcat-pub
# x2.ProcReadMsg  proc:kcat-pub
# x2.ProcStartMsg  proc:kcat-sub  cmd:"kcat -b 127.0.0.1:$kafkaport -C -t test4 -e -X fetch.wait.max.ms=0"
# x2.ProcReadMsg  proc:kcat-sub
# x2.ProcStartMsg  proc:kcat-sub  cmd:"kcat -b 127.0.0.1:$kafkaport -C -t test5 -e -X fetch.wait.max.ms=0 -X allow.auto.create.topics=false"
# x2.ProcReadMsg  proc:kcat-sub
# x2.ProcStartMsg  proc:kcat-sub  cmd:"kcat -b 127.0.0.1:$kafkaport -C -t test6 -e -X fetch.wait.max.ms=1000 -X allow.auto.create.topics=true -c 1"
# x2.ProcStartMsg  proc:kcat-pub  cmd:"kcat -b 127.0.0.1:$kafkaport -P -t test6 -X allow.auto.create.topics=false -X topic.metadata.propagation.max.ms=1000"
# x2.ProcMsg  proc:kcat-pub  payload:"FIDES SINE OPERIBUS MORTUA EST"
# x2.ProcEofMsg  proc:kcat-pub
# x2.ProcReadMsg  proc:kcat-pub
# x2.ProcReadMsg  proc:kcat-sub
# x2.ProcStartMsg  proc:kapi  cmd:"kapi -connect -broker::$kafkaport"
# x2.ProcMsg  proc:kapi  payload:"kafka2.CreateTopicsRequest  request_api_version:7  topics.0:'kafka2.CreatableTopic19q  name:test7  num_partitions:3  replication_factor:1'"
# x2.ProcEofMsg  proc:kapi
# x2.ProcReadMsg  proc:kapi
# x2.ProcStartMsg  proc:kcat-md  cmd:"kcat -b 127.0.0.1:$kafkaport -L"
# x2.ProcReadMsg  proc:kcat-md
# x2.ProcStartMsg  proc:kcat-pub  cmd:"kcat -b 127.0.0.1:$kafkaport -P -t test7 -p 0"
# x2.ProcMsg  proc:kcat-pub  payload:"PARTITIO NULLA"
# x2.ProcEofMsg  proc:kcat-pub
# x2.ProcReadMsg  proc:kcat-pub
# x2.ProcStartMsg  proc:kcat-pub  cmd:"kcat -b 127.0.0.1:$kafkaport -P -t test7 -p 1"
# x2.ProcMsg  proc:kcat-pub  payload:"PARTITIO PRIMA"
# x2.ProcEofMsg  proc:kcat-pub
# x2.ProcReadMsg  proc:kcat-pub
# x2.ProcStartMsg  proc:kcat-pub  cmd:"kcat -b 127.0.0.1:$kafkaport -P -t test7 -p 2"
# x2.ProcMsg  proc:kcat-pub  payload:"PARTITIO ALTERA"
# x2.ProcEofMsg  proc:kcat-pub
# x2.ProcReadMsg  proc:kcat-pub
# x2.ProcStartMsg  proc:kcat-sub  cmd:"kcat -b 127.0.0.1:$kafkaport -C -t test7 -p 0 -e -X fetch.wait.max.ms=0"
# x2.ProcReadMsg  proc:kcat-sub
# x2.ProcStartMsg  proc:kcat-sub  cmd:"kcat -b 127.0.0.1:$kafkaport -C -t test7 -p 1 -e -X fetch.wait.max.ms=0"
# x2.ProcReadMsg  proc:kcat-sub
# x2.ProcStartMsg  proc:kcat-sub  cmd:"kcat -b 127.0.0.1:$kafkaport -C -t test7 -p 2 -e -X fetch.wait.max.ms=0"
# x2.ProcReadMsg  proc:kcat-sub
# x2.ProcStartMsg  proc:kapi  cmd:"kapi -connect -broker::$kafkaport"
# x2.ProcMsg  proc:kapi  payload:"kafka2.FetchRequest  request_api_version:11  max_wait_ms:5000  topics.0:\"kafka2.FetchTopic1q  topic:test7  partitions.0:'kafka2.FetchPartition1q  partition:0 fetch_offset:0'  partitions.1:'kafka2.FetchPartition1q  partition:1  fetch_offset:0'  partitions.2:'kafka2.FetchPartition1q  partition:2  fetch_offset:0'\""
# x2.ProcMsg  proc:kapi  payload:"kafka2.FetchRequest  request_api_version:11  max_wait_ms:0  topics.0:\"kafka2.FetchTopic1q  topic:test7  partitions.0:'kafka2.FetchPartition1q  partition:0 fetch_offset:2'  partitions.1:'kafka2.FetchPartition1q  partition:1  fetch_offset:2'  partitions.2:'kafka2.FetchPartition1q  partition:2  fetch_offset:2'\""
# x2.ProcEofMsg  proc:kapi
# x2.ProcReadMsg  proc:kapi
# x2.ProcMsg proc:x2  payload:ams.TerminateMsg
# x2.ProcReadMsg  proc:x2
# ams.TerminateMsg
# EOF

cat <<'EOF' > /tmp/atf_x2_metadata
x2.ProcStartMsg  proc:x2  cmd:"$bindir/x2sup -i -in:$tempdir/data -bindir:$bindir -random_ports"
x2.ProcReadMsg  proc:x2  until:READY_FOR_TEST
x2.ProcStartMsg  proc:kcat-md  cmd:"kcat -b 127.0.0.1:$kafkaport -L"
x2.ProcReadMsg  proc:kcat-md
x2.ProcStartMsg  proc:kcat-md  cmd:"kcat -b 127.0.0.1:$kafkaport -L -t test2 -X allow.auto.create.topics=true"
x2.ProcReadMsg  proc:kcat-md
x2.ProcMsg proc:x2  payload:ams.TerminateMsg
x2.ProcReadMsg  proc:x2
ams.TerminateMsg
EOF

atf_x2 -comptest:mytest -timeout_sec:3  -dbgshell < /tmp/atf_x2_metadata
exit 





cat <<'EOF' > /tmp/atf_x2_wrk
x2.ProcStartMsg  proc:x2  cmd:"$bindir/x2sup -i -in:$tempdir/data -bindir:$bindir -random_ports"
x2.ProcReadMsg  proc:x2  until:READY_FOR_TEST
x2.ProcStartMsg  proc:x2cli cmd:"$bindir/x2cli -conn_timeout:1.0 -conn_backoff:0.1 -conn_reconnect:Y -conn_max_attempts:50 -gw::$x2port"
x2.ProcReadMsg  proc:x2cli until:connected
x2.ProcMsg  proc:x2cli  payload:"help disk"
x2.ProcReadMsg  proc:x2cli until:disk
x2.ProcMsg  proc:x2cli  payload:""
x2.ProcReadMsg  proc:x2cli until:disk
x2.ProcMsg  proc:x2cli  payload:"at % help node"
x2.ProcReadMsg  proc:x2cli until:"x2net-0-0   node"
x2.ProcEofMsg  proc:x2cli
x2.ProcReadMsg  proc:x2cli
x2.ProcMsg proc:x2  payload:ams.TerminateMsg
x2.ProcReadMsg  proc:x2
ams.TerminateMsg
EOF

cat <<'EOF' > /tmp/atf_x2_wrk_hang
x2.ProcStartMsg  proc:x2  cmd:"$bindir/x2sup -i -in:$tempdir/data -bindir:$bindir -random_ports"
x2.ProcReadMsg  proc:x2  until:READY_FOR_TEST
x2.ProcStartMsg  proc:x2cli cmd:"$bindir/x2cli -conn_timeout:1.0 -conn_backoff:0.1 -conn_reconnect:Y -conn_max_attempts:50 -gw::$x2port"
x2.ProcReadMsg  proc:x2cli until:connected
x2.ProcMsg  proc:x2cli  payload:"help disk"
x2.ProcReadMsg  proc:x2cli until:disk
x2.ProcMsg  proc:x2cli  payload:""
x2.ProcReadMsg  proc:x2cli until:disk
x2.ProcMsg  proc:x2cli  payload:"at % help node"
x2.ProcReadMsg  proc:x2cli until:"kukareku"
x2.ProcEofMsg  proc:x2cli
x2.ProcReadMsg  proc:x2cli
x2.ProcMsg proc:x2  payload:ams.TerminateMsg
x2.ProcReadMsg  proc:x2
ams.TerminateMsg
EOF


# atf_x2 < /tmp/atf_x2_wrk
# atf_x2 < /tmp/atf_x2_wrk_hang
# atf_x2 -comptest:mytest -timeout_sec:3 -v -dbgshell 
# set -x
# atf_x2 -comptest:mytest -timeout_sec:3  -dbgshell < /tmp/atf_x2_wrk_hang


exit

diff --git a/data/atfdb/tmsg.ssim b/data/atfdb/tmsg.ssim
index 71b232d51..282ab4bfd 100644
--- a/data/atfdb/tmsg.ssim
+++ b/data/atfdb/tmsg.ssim
@@ -133,7 +133,7 @@ atfdb.tmsg  tmsg:atf_x2.Cli/100050.in  istuple:N  msg:"x2.ProcReadMsg  proc:x2cl
 atfdb.tmsg  tmsg:atf_x2.Cli/100060.in  istuple:N  msg:'x2.ProcMsg  proc:x2cli  payload:""'
 atfdb.tmsg  tmsg:atf_x2.Cli/100070.in  istuple:N  msg:"x2.ProcReadMsg  proc:x2cli until:disk"
 atfdb.tmsg  tmsg:atf_x2.Cli/100080.in  istuple:N  msg:'x2.ProcMsg  proc:x2cli  payload:"at % help node"'
-atfdb.tmsg  tmsg:atf_x2.Cli/100090.in  istuple:N  msg:'x2.ProcReadMsg  proc:x2cli until:"x2net-0-0   node"'
+atfdb.tmsg  tmsg:atf_x2.Cli/100090.in  istuple:N  msg:'x2.ProcReadMsg  proc:x2cli until:"kyky"'
 atfdb.tmsg  tmsg:atf_x2.Cli/100100.in  istuple:N  msg:"x2.ProcEofMsg  proc:x2cli"
 atfdb.tmsg  tmsg:atf_x2.Cli/100110.in  istuple:N  msg:"x2.ProcReadMsg  proc:x2cli"
 atfdb.tmsg  tmsg:atf_x2.Cli/100120.in  istuple:N  msg:"x2.ProcMsg proc:x2  payload:ams.TerminateMsg"