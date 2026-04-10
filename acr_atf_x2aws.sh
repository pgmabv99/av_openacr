#!/bin/bash
set -x
set -e


init=false
init=true
# one time only !!!!!!!!!!!!!!!!!!
if [ "$init" = "true" ]; then
  acr_ed -del -target:atf_x2aws -write || true
  acr_ed -create -target:atf_x2aws -write -comment "atf_x2aws target"
  acr_ed -create -srcfile cpp/atf_x2aws/atf_x2aws.cpp -write -comment "awcli  testing tool"
  acr_compl -install
fi





#  mcb
set -e
acr_ed -del    -ctype atf_x2aws.FMcb                               -write  || true
acr_ed -create -ctype atf_x2aws.FMcb                               -write -comment "Main CB"
acr_ed -create -field atf_x2aws.FMcb.current_test                       -arg bool    -write -comment "reserved "


# include  atf_x2aws.FMcb into _db
acr_ed -del    -field atf_x2aws.FDb.mcb                          -write
acr_ed -create -field atf_x2aws.FDb.mcb                          -arg atf_x2aws.FMcb        -write -comment ""
# -------------------


#  set parms for atf_x2aws
acr -merge  -write <<EOF
acr.delete dmmeta.field  field:command.atf_x2aws.comptest
acr.delete dmmeta.field  field:command.atf_x2aws.bindir
acr.delete dmmeta.field  field:command.atf_x2aws.timeout

EOF

acr -merge -write <<EOF
    dmmeta.field  field:command.atf_x2aws.comptest                arg:algo.cstring  reftype:Val  dflt:'""'  comment:"comtest name"
    dmmeta.field  field:command.atf_x2aws.bindir                  arg:algo.cstring  reftype:Val  dflt:'"bin"'  comment:""
    dmmeta.field  field:command.atf_x2aws.timeout                 arg:double   reftype:Val  dflt:8.0   comment:""

EOF


# ------------
amc

echo "done!!!!!!!!!!!!"

exit