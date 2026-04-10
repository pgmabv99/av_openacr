#!/bin/bash
set -xe

bindir=bin
input=temp/atf_x2aws/input.ssim

mkdir -p temp/atf_x2aws

cat > "$input" <<EOF
x2.ProcStartMsg  proc:x2aws  cmd:"\$bindir/x2aws -whoami -env:awsci1"
x2.ProcReadMsg  proc:x2aws   until:awuser:awsx2admin 
x2.ProcStartMsg  proc:x2aws1  cmd:"\$bindir/x2aws -describe  -devsnap:awsci1.sv1/sda1 -env:awsci1"
x2.ProcReadMsg  proc:x2aws1   until:state:completed
ams.TerminateMsg
EOF

$bindir/atf_x2aws -comptest:atf_x2aws.smoke  -bindir:$bindir -timeout:8.0  < "$input"

exit
