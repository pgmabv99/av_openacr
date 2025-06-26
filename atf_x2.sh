#!/bin/bash


cat <<'EOF' > /tmp/atf_x2_metadata
x2.ProcStartMsg  proc:x2  cmd:"$bindir/x2sup -i -in:$tempdir/data -bindir:$bindir -random_ports"
x2.ProcReadMsg  proc:x2  until:READY_FOR_TEST
x2.ProcStartMsg  proc:kapi  cmd:"kapi -connect -broker::$kafkaport"
x2.ProcMsg  proc:kapi  payload:"kafka2.DescribeClusterRequest  request_api_version:0  correlation_id:3  client_id:kafka-ui-admin-1746648345-1  include_cluster_authorized_operations:N  endpoint_type:1  include_fenced_brokers:N"
x2.ProcEofMsg  proc:kapi
x2.ProcReadMsg  proc:kapi
x2.ProcMsg proc:x2  payload:ams.TerminateMsg
x2.ProcReadMsg  proc:x2
ams.TerminateMsg
EOF

atf_x2 -comptest:mytest -timeout_sec:3  -dbgshell -v < /tmp/atf_x2_metadata
exit 

#   test 

comptest atf_x2.KafkaDescribeCluster -bindir:$bindir -comptest:$comptest| sed -E -f test/filt.sed
comment KAFKA DescribeCluster Test
exit_code 0
x2.ProcStartMsg  proc:x2  cmd:"$bindir/x2sup -i -in:$tempdir/data -bindir:$bindir -random_ports"
x2.ProcReadMsg  proc:x2  until:READY_FOR_TEST
x2.ProcStartMsg  proc:kapi  cmd:"kapi -connect -broker::$kafkaport"
x2.ProcMsg  proc:kapi  payload:"kafka2.DescribeClusterRequest  request_api_version:0  correlation_id:3  client_id:kafka-ui-admin-1746648345-1  include_cluster_authorized_operations:N  endpoint_type:1  include_fenced_brokers:N"
x2.ProcEofMsg  proc:kapi
x2.ProcReadMsg  proc:kapi
x2.ProcMsg proc:x2  payload:ams.TerminateMsg
x2.ProcReadMsg  proc:x2
ams.TerminateMsg

# end of test



cat <<'EOF' > /tmp/atf_x2_metadata
x2.ProcStartMsg  proc:x2  cmd:"$bindir/x2sup -i -in:$tempdir/data -bindir:$bindir -random_ports"
x2.ProcReadMsg  proc:x2  until:READY_FOR_TEST
x2.ProcStartMsg  proc:kcat  cmd:"kcat -b 127.0.0.1:$kafkaport -L"
x2.ProcReadMsg  proc:kcat
x2.ProcStartMsg  proc:kcat  cmd:"kcat -b 127.0.0.1:$kafkaport -X security.protocol=SASL_PLAINTEXT -X sasl.mechanism=PLAIN -X sasl.username=root -X sasl.password=secret -L"
x2.ProcReadMsg  proc:kcat
x2.ProcStartMsg  proc:kcat  cmd:"kcat -b 127.0.0.1:$kafkaport -X security.protocol=SASL_PLAINTEXT -X sasl.mechanism=PLAIN -X sasl.username=alice -X sasl.password=foo -L"
x2.ProcReadMsg  proc:kcat
x2.ProcStartMsg  proc:kcat  cmd:"kcat -b 127.0.0.1:$kafkaport -X security.protocol=SASL_PLAINTEXT -X sasl.mechanism=PLAIN -X sasl.username=bob -X sasl.password=bar -L"
x2.ProcReadMsg  proc:kcat
x2.ProcStartMsg  proc:kcat  cmd:"kcat -b 127.0.0.1:$kafkaport -X security.protocol=SASL_PLAINTEXT -X sasl.mechanism=PLAIN -X sasl.username=charlie -X sasl.password=baz -L"
x2.ProcReadMsg  proc:kcat
x2.ProcStartMsg  proc:kcat  cmd:"kcat -b 127.0.0.1:$kafkaport -X security.protocol=SASL_PLAINTEXT -X sasl.mechanism=PLAIN -X sasl.username=dave -X sasl.password=qux -L"
x2.ProcReadMsg  proc:kcat  until:FAIL
x2.ProcKillMsg  proc:kcat  signal:9
x2.ProcReadMsg  proc:kcat
x2.ProcStartMsg  proc:kcat  cmd:"kcat -b 127.0.0.1:$kafkaport -X security.protocol=SASL_PLAINTEXT -X sasl.mechanism=PLAIN -X sasl.username=root -X sasl.password=blah -L"
x2.ProcReadMsg  proc:kcat  until:FAIL
x2.ProcKillMsg  proc:kcat  signal:9
x2.ProcReadMsg  proc:kcat
x2.ProcStartMsg  proc:kcat  cmd:"kcat -b 127.0.0.1:$kafkaport -X security.protocol=SASL_PLAINTEXT -X sasl.mechanism=PLAIN -X sasl.username=alice -X sasl.password=blah -L"
x2.ProcReadMsg  proc:kcat  until:FAIL
x2.ProcKillMsg  proc:kcat  signal:9
x2.ProcReadMsg  proc:kcat
x2.ProcMsg proc:x2  payload:ams.TerminateMsg
x2.ProcReadMsg  proc:x2
ams.TerminateMsg
EOF
# cat <<'EOF' > /tmp/atf_x2_metadata
# x2.ProcStartMsg  proc:x2  cmd:"$bindir/x2sup -i -in:$tempdir/data -bindir:$bindir -random_ports -tls -tls_cert:test/crt/x2.crt -tls_key:test/crt/x2.key -tls_ca:test/crt/ca.crt -mtls"
# x2.ProcReadMsg  proc:x2  until:READY_FOR_TEST
# x2.ProcStartMsg  proc:kcat  cmd:"kcat -b 127.0.0.1:$kafkasport -X security.protocol=SSL -X ssl.ca.location=test/crt/ca.crt -X ssl.certificate.location=test/crt/root.crt -X ssl.key.location=test/crt/root.key -L"
# x2.ProcReadMsg  proc:kcat
# x2.ProcKillMsg  proc:kcat  signal:9
# x2.ProcReadMsg  proc:kcat
# x2.ProcMsg proc:x2  payload:ams.TerminateMsg
# x2.ProcReadMsg  proc:x2
# ams.TerminateMsg
# EOF









# cat <<'EOF' > /tmp/atf_x2_metadata
# x2.ProcStartMsg  proc:x2  cmd:"$bindir/x2sup -i -in:$tempdir/data -bindir:$bindir -random_ports"
# x2.ProcReadMsg  proc:x2  until:READY_FOR_TEST
# x2.ProcMsg  proc:kapi  payload:"kafka2.DescribeClusterRequest  request_api_version:0  correlation_id:3  client_id:kafka-ui-admin-1746648345-1  include_cluster_authorized_operations:N  endpoint_type:1  include_fenced_brokers:N"
# x2.ProcReadMsg  proc:kapi
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



# cat <<'EOF' > /tmp/atf_x2_wrk
# x2.ProcStartMsg  proc:x2  cmd:"$bindir/x2sup -i -in:$tempdir/data -bindir:$bindir -random_ports"
# x2.ProcReadMsg  proc:x2  until:READY_FOR_TEST
# x2.ProcStartMsg  proc:x2cli cmd:"$bindir/x2cli -conn_timeout:1.0 -conn_backoff:0.1 -conn_reconnect:Y -conn_max_attempts:50 -gw::$x2port"
# x2.ProcReadMsg  proc:x2cli until:connected
# x2.ProcMsg  proc:x2cli  payload:"help disk"
# x2.ProcReadMsg  proc:x2cli until:disk
# x2.ProcMsg  proc:x2cli  payload:""
# x2.ProcReadMsg  proc:x2cli until:disk
# x2.ProcMsg  proc:x2cli  payload:"at % help node"
# x2.ProcReadMsg  proc:x2cli until:"x2net-0-0   node"
# x2.ProcEofMsg  proc:x2cli
# x2.ProcReadMsg  proc:x2cli
# x2.ProcMsg proc:x2  payload:ams.TerminateMsg
# x2.ProcReadMsg  proc:x2
# ams.TerminateMsg
# EOF

# cat <<'EOF' > /tmp/atf_x2_wrk_hang
# x2.ProcStartMsg  proc:x2  cmd:"$bindir/x2sup -i -in:$tempdir/data -bindir:$bindir -random_ports"
# x2.ProcReadMsg  proc:x2  until:READY_FOR_TEST
# x2.ProcStartMsg  proc:x2cli cmd:"$bindir/x2cli -conn_timeout:1.0 -conn_backoff:0.1 -conn_reconnect:Y -conn_max_attempts:50 -gw::$x2port"
# x2.ProcReadMsg  proc:x2cli until:connected
# x2.ProcMsg  proc:x2cli  payload:"help disk"
# x2.ProcReadMsg  proc:x2cli until:disk
# x2.ProcMsg  proc:x2cli  payload:""
# x2.ProcReadMsg  proc:x2cli until:disk
# x2.ProcMsg  proc:x2cli  payload:"at % help node"
# x2.ProcReadMsg  proc:x2cli until:"kukareku"
# x2.ProcEofMsg  proc:x2cli
# x2.ProcReadMsg  proc:x2cli
# x2.ProcMsg proc:x2  payload:ams.TerminateMsg
# x2.ProcReadMsg  proc:x2
# ams.TerminateMsg
# EOF


# atf_x2 < /tmp/atf_x2_wrk
# atf_x2 < /tmp/atf_x2_wrk_hang
# atf_x2 -comptest:mytest -timeout_sec:3 -v -dbgshell 
# set -x
# atf_x2 -comptest:mytest -timeout_sec:3  -dbgshell < /tmp/atf_x2_wrk_hang


exit

s/(tsc|signature|timestamp|tend|crc|port):[^ "]+/\1:***/g
s/^(lib_ws.server_(stopped|started)  server:[^:]*:)[0-9]*/\1***/g
/(netio|connected|broker|sasl|ssl)/s/([0-9]+\.[0-9]+\.[0-9]+\.[0-9]:)[0-9]+/\1*/g
/x2\.ProcMsg\s+proc:x2(n[01])?\s+/d
s/[0-2][0-9]:[0-6][0-9]:[0-6][0-9] (Published|Subscribing)/**:**:** \1/g
/proc:kcat-sub  payload:"%7/d
/x2.Msg/s/(from):[^ "]+/\1:***/g
s/(%3\|)[0-9]+\.[0-9]+/\1***/
s/after [0-9]+ms/after ***ms/
/Unexpected NATS error/d
s/(nats:)( permissions violation:)/\1/
/x2gf.msgcache/s/n_fetch:[^ "]+/n_fetch:***/
/SIT VERA/s/("ts":)[0-9]{13}/\1MILLISEC/
s/(id:)[0-9a-f-]{36}/\1***/
