#!/bin/bash
set -x
set -e


init=false
# init=true
# one time only !!!!!!!!!!!!!!!!!!
if [ "$init" = "true" ]; then
  acr_ed -del -target:atf_awcli -write || true
  acr_ed -create -target:atf_awcli -write -comment "atf_awcli target"
  acr_ed -create -srcfile cpp/atf_awcli/atf_awcli.cpp -write -comment "awcli  testing tool"
  acr_compl -install
fi





#  mcb
set -e
acr_ed -del    -ctype atf_awcli.FMcb                               -write  || true
acr_ed -create -ctype atf_awcli.FMcb                               -write -comment "Main CB"
acr_ed -create -field atf_awcli.FMcb.dummy                        -arg algo.cstring      -write -comment "sample field"


# include  atf_awcli.FMcb into _db
acr_ed -del    -field atf_awcli.FDb.mcb                          -write
acr_ed -create -field atf_awcli.FDb.mcb                          -arg atf_awcli.FMcb        -write -comment ""
# -------------------


#  set parms for atf_awcli
acr -merge  -write <<EOF
acr.delete dmmeta.field  field:command.atf_awcli.test
acr.delete dmmeta.field  field:command.atf_awcli.env

EOF

acr -merge -write <<EOF
    dmmeta.field  field:command.atf_awcli.test                 arg:algo.cstring  reftype:Val  dflt:'"whoami"'  comment:""
    dmmeta.field  field:command.atf_awcli.env                  arg:algo.cstring  reftype:Val  dflt:'"awsci1"'  comment:"awsci1 environment"
EOF


acr -merge  -write <<EOF
 acr.delete dmmeta.floadtuples  field:command.atf_awcli.in 
EOF
acr -merge -write <<EOF
dmmeta.floadtuples  field:command.atf_awcli.in  comment:""
EOF

acr_ed -create -finput -ssimfile:awsdb.awtest -indexed -target:atf_awcli -write -comment "include   from ssimfile"
acr -merge  -write <<EOF
 acr.delete dmmeta.floadtuples  field:command.atf_awcli.in 
EOF
acr -merge -write <<EOF
dmmeta.floadtuples  field:command.atf_awcli.in  comment:""
EOF

acr_ed -create -finput -ssimfile:awsdb.awtest -indexed -target:atf_awcli -write -comment "include   from ssimfile"

# ------------
amc

# ai

echo "done!!!!!!!!!!!!"

exit

# one time ??

# new ssim file

acr_ed -create -ssimfile awsdb.awtest -write

acr -merge  -write <<EOF
 acr.delete mmeta.finput  field:atf_awcli.FDb.awtest
EOF
acr_ed -create -finput -ssimfile:awsdb.awtest -indexed -target:atf_awcli -write -comment "include   from ssimfile"

acr_ed -create -field atf_awcli.FAwtest.step -arg u64 -reftype Hook -write

# for dynamic input
acr -merge  -write <<EOF
 acr.delete dmmeta.floadtuples  field:command.atf_awcli.in 
EOF
acr -merge -write <<EOF
dmmeta.floadtuples  field:command.atf_awcli.in  comment:""
EOF

# for static
acr -merge -write <<EOF
dmmeta.gstatic  field:atf_awcli.FDb.awtest
EOF