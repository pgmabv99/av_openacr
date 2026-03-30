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
acr_ed -create -field atf_awcli.FMcb.current_test                       -arg bool    -write -comment "current test result passed fro step"


# include  atf_awcli.FMcb into _db
acr_ed -del    -field atf_awcli.FDb.mcb                          -write
acr_ed -create -field atf_awcli.FDb.mcb                          -arg atf_awcli.FMcb        -write -comment ""
# -------------------


#  set parms for atf_awcli
acr -merge  -write <<EOF
acr.delete dmmeta.field  field:command.atf_awcli.test
acr.delete dmmeta.field  field:command.atf_awcli.env
acr.delete dmmeta.field  field:command.atf_awcli.maxerr
acr.delete dmmeta.field  field:command.atf_awcli.cleanup_only

EOF

acr -merge -write <<EOF
    dmmeta.field  field:command.atf_awcli.test                 arg:algo.cstring  reftype:RegxSql  dflt:'"%"'  comment:"test selector"
    dmmeta.field  field:command.atf_awcli.env                  arg:algo.cstring  reftype:Val  dflt:'"awsci1"'  comment:"aws* environment"
    dmmeta.field  field:command.atf_awcli.maxerr               arg:u32           reftype:Val  dflt:3   comment:"Exit after this many errors"
    dmmeta.field  field:command.atf_awcli.cleanup_only               arg:bool          reftype:Val  dflt:false   comment:"Only perform cleanup, do not run tests"
EOF


# ------------
amc

echo "done!!!!!!!!!!!!"

exit

# one time ??

# for static
# new ssim file
acr_ed -create -ssimfile awsdb.awtest -write
# move in at compile time
acr_ed -create -gstatic  -ssimfile:awsdb.awtest -indexed -target:atf_awcli -write -comment "include static from ssimfile"