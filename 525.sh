#!/bin/bash
set -x
set -e

cd $HOME/arnd

# acr_ed -del -target:x2bm_pcap -write 
# acr_ed -create -target:x2bm_pcap -write 
# acr_compl -install
# amc

acr_ed -del  -ctype x2bm_pcap.FTcp_pair -write || true
acr_ed -del  -ctype x2bm_pcap.FFrame     -write || true
# acr_ed -del  -ctype x2bm_pcap.FTcp_pair -write 
# acr_ed -del  -ctype x2bm_pcap.FFrame     -write 


#tcp pair
acr_ed -create -ctype x2bm_pcap.FTcp_pair -pooltype Tpool -arg Smallstr50 -indexed -write  -comment "tcp pair entry"
acr_ed -create -field x2bm_pcap.FTcp_pair.count -arg i32  -write
acr_ed -create -field x2bm_pcap.FTcp_pair.syn_count -arg i32  -write  --comment "number of syn (connection start)"
acr_ed -create -field x2bm_pcap.FTcp_pair.fin_count -arg i32  -write  --comment "number of fin (connection end)"
acr_ed -create -field x2bm_pcap.FTcp_pair.seq_gap_count   -arg i32               -write     -comment "sequence   gap count "
acr_ed -create -field x2bm_pcap.FTcp_pair.isn       -arg i32  -write  --comment "initial sequence number"
acr_ed -create -field x2bm_pcap.FTcp_pair.seq_next    -arg i32  -write  --comment "running high end of seq+payload"
# pointers from above
acr_ed -create -field x2bm_pcap.FDb.zd_tcp_pair -cascdel -write -comment ""

#frame 
acr_ed -create -ctype x2bm_pcap.FFrame -pooltype Tpool -write  -comment "tcp frame entry"
acr_ed -create -field x2bm_pcap.FFrame.p_tcp_pair -arg x2bm_pcap.FTcp_pair -reftype Upptr -write

acr_ed -create -field x2bm_pcap.FFrame.iframe    -arg u64                -write     -comment "global frame number"
acr_ed -create -field x2bm_pcap.FFrame.seq   -arg     i32               -write     -comment "sequence number"
acr_ed -create -field x2bm_pcap.FFrame.seq_gap   -arg i32               -write     -comment "sequence number gap "

acr_ed -create -field x2bm_pcap.FFrame.ack   -arg i32                -write     -comment "ack      number"
acr_ed -create -field x2bm_pcap.FFrame.p_pay -arg  u8  -reftype Tary -write     -comment "p to payload buffer "
acr_ed -create -field x2bm_pcap.FFrame.th_flags -arg  u8             -write     -comment "tcp flags "
acr_ed -create -field x2bm_pcap.FFrame.direction -arg  i32            -write     -comment "direction : 1 low to high IP. -1 high to low IP"

#  pointers from above
acr_ed -create -field x2bm_pcap.FTcp_pair.zd_frames -arg x2bm_pcap.FFrame -via x2bm_pcap.FFrame.p_tcp_pair                                 -cascdel -write -comment "double list of frames"
acr_ed -create -field x2bm_pcap.FTcp_pair.bh_frames -arg x2bm_pcap.FFrame -via x2bm_pcap.FFrame.p_tcp_pair  -sortfld x2bm_pcap.FFrame.seq  -cascdel -write -comment "binary heap  of frames"



#  set parms for x2bm_pcap
acr -merge  -write <<EOF
acr.delete dmmeta.field  field:command.x2bm_pcap.files  arg:algo.cstring  reftype:RegxSql  dflt:'""'  comment:""
acr.delete dmmeta.field  field:command.x2bm_pcap.dir    arg:algo.cstring  reftype:RegxSql  dflt:'""'  comment:""
acr.delete dmmeta.field  field:command.x2bm_pcap.ndisp  arg:i32  reftype:Val  dflt:5  comment:"default number pairs to display"
EOF
acr -merge -write <<EOF
dmmeta.field  field:command.x2bm_pcap.files  arg:algo.cstring  reftype:RegxSql  dflt:'"%"'  comment:"Regx of file(s) to test"
dmmeta.field  field:command.x2bm_pcap.dir   arg:algo.cstring  reftype:Val       dflt:'"/home/avorovich/pcap/"'  comment:"dir with file(s) to test"
dmmeta.field  field:command.x2bm_pcap.ndisp  arg:i32  reftype:Val  dflt:5  comment:"default number pairs to display"
EOF

amc 
ai 

echo "done!!!!!!!!!!!!"