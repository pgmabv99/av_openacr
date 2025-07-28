#!/bin/bash

# cat <<'EOF' > /tmp/atf_x2_wrk_hang
# x2.ProcStartMsg  proc:x2  cmd:"$bindir/x2sup -i -temp -bindir:$bindir -random_ports"
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

# atf_x2 -comptest:mytest -timeout_sec:3   < /tmp/atf_x2_wrk_hang
# retcode=$?
# echo "Return code: $retcode"
# atf_x2 -comptest:mytest -timeout_sec:3  -dbgshell < /tmp/atf_x2_wrk_hang
# exit
# -------------------------------
cat <<'EOF' > /tmp/atf_x2_metadata
x2.ProcStartMsg  proc:x2  cmd:"$bindir/x2sup -i -temp -bindir:$bindir -random_ports"
x2.ProcReadMsg  proc:x2  until:READY_FOR_TEST
x2.ProcStartMsg  proc:kapi  cmd:"kapi -connect -broker::$kafkaport"
x2.ProcMsg  proc:kapi  payload:"kafka2.DescribeClusterRequest  request_api_version:0  correlation_id:3  client_id:kafka-ui-admin-1746648345-1  include_cluster_authorized_operations:N  endpoint_type:1  include_fenced_brokers:N"
x2.ProcEofMsg  proc:kapi
x2.ProcReadMsg  proc:kapi
x2.ProcMsg proc:x2  payload:ams.TerminateMsg
x2.ProcReadMsg  proc:x2
ams.TerminateMsg
EOF


atf_x2 -comptest:mytest -timeout_sec:3   -v < /tmp/atf_x2_metadata
retcode=$?
echo "Return code: $retcode"
exit 

#   test 

comptest atf_x2.KafkaDescribeCluster -bindir:$bindir -comptest:$comptest| sed -E -f test/filt.sed
comment KAFKA DescribeCluster Test
exit_code 0
x2.ProcStartMsg  proc:x2  cmd:"$bindir/x2sup -i -temp -bindir:$bindir -random_ports"
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
x2.ProcStartMsg  proc:x2  cmd:"$bindir/x2sup -i -temp -bindir:$bindir -random_ports"
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
# x2.ProcStartMsg  proc:x2  cmd:"$bindir/x2sup -i -temp -bindir:$bindir -random_ports -tls -tls_cert:test/crt/x2.crt -tls_key:test/crt/x2.key -tls_ca:test/crt/ca.crt -mtls"
# x2.ProcReadMsg  proc:x2  until:READY_FOR_TEST
# x2.ProcStartMsg  proc:kcat  cmd:"kcat -b 127.0.0.1:$kafkasport -X security.protocol=SSL -X ssl.ca.location=test/crt/ca.crt -X ssl.certificate.location=test/crt/root.crt -X ssl.key.location=test/crt/root.key -L"
# x2.ProcReadMsg  proc:kcat
# x2.ProcKillMsg  proc:kcat  signal:9
# x2.ProcReadMsg  proc:kcat
# x2.ProcMsg proc:x2  payload:ams.TerminateMsg
# x2.ProcReadMsg  proc:x2
# ams.TerminateMsg
# EOF







