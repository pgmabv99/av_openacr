#!/bin/bash
set -x
set -e

cd $HOME/arnd

# acr_ed -del -target:x2bm_pcap -write 
# acr_ed -create -target:x2bm_pcap -write 
# acr_compl -install
# amc

#  del
acr_ed -del  -ctype x2bm_pcap.FMac_pair -write || true
acr_ed -del  -ctype x2bm_pcap.FTcp_pair -write || true

#  create ctype with one field and index on it 
acr_ed -create -ctype x2bm_pcap.FMac_pair -pooltype Tpool -indexed -write  -comment "mac pair entry"
acr_ed -create -field x2bm_pcap.FMac_pair.count -arg i32  -write
acr_ed -create -field x2bm_pcap.FDb.zd_mac_pair -cascdel -write -comment ""

acr_ed -create -ctype x2bm_pcap.FTcp_pair -pooltype Tpool -indexed -write  -comment "tcp pair entry"
acr_ed -create -field x2bm_pcap.FTcp_pair.count -arg i32  -write
acr_ed -create -field x2bm_pcap.FDb.zd_tcp_pair -cascdel -write -comment ""


acr -merge  -write <<EOF
acr.delete dmmeta.field  field:command.x2bm_pcap.mac   arg:bool  reftype:Val  dflt:""  comment:""
acr.delete dmmeta.field  field:command.x2bm_pcap.files  arg:algo.cstring  reftype:RegxSql  dflt:'""'  comment:""
acr.delete dmmeta.field  field:command.x2bm_pcap.ndisp  arg:i32  reftype:Val  dflt:5  comment:"default number pairs to display"
EOF
acr -merge -write <<EOF
dmmeta.field  field:command.x2bm_pcap.mac  arg:bool  reftype:Val  dflt:"false"  comment:"to test mac pairs"
dmmeta.field  field:command.x2bm_pcap.files  arg:algo.cstring  reftype:RegxSql  dflt:'"%"'  comment:"Regx of file(s) to test"
dmmeta.field  field:command.x2bm_pcap.dir   arg:algo.cstring  reftype:Val       dflt:'"/home/avorovich/pcap/"'  comment:"dir with file(s) to test"
dmmeta.field  field:command.x2bm_pcap.ndisp  arg:i32  reftype:Val  dflt:5  comment:"default number pairs to display"
EOF

amc 
ai 