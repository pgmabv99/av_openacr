#!/bin/bash



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
atf_x2 -comptest:mytest -timeout_sec:3  -dbgshell < /tmp/atf_x2_wrk_hang

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