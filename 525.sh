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
acr_ed -del  -ctype x2bm_pcap.FClient_id    -write || true
acr_ed -del  -ctype x2bm_pcap.FKafka    -write || true
# acr_ed -del  -ctype x2bm_pcap.FTcp_pair -write 
# acr_ed -del  -ctype x2bm_pcap.FFrame     -write 
# acr_ed -del  -ctype x2bm_pcap.FClient_id   -write 
# acr_ed -del  -ctype x2bm_pcap.FCorr_id    -write 


#--------------tcp pair
acr_ed -create -ctype x2bm_pcap.FTcp_pair -pooltype Tpool -arg Smallstr50 -indexed -write  -comment "tcp pair entry"
acr_ed -create -field x2bm_pcap.FTcp_pair.frame_count -arg i32  -write  --comment "number of frames for this pair"
acr_ed -create -field x2bm_pcap.FTcp_pair.syn_count -arg i32  -write  --comment "number of syn (connection start)"
acr_ed -create -field x2bm_pcap.FTcp_pair.fin_count -arg i32  -write  --comment "number of fin (connection end)"
acr_ed -create -field x2bm_pcap.FTcp_pair.seq_gap_pos_count   -arg u32              -write     -comment "pos sequence  gap count "
acr_ed -create -field x2bm_pcap.FTcp_pair.seq_gap_neg_count   -arg u32              -write     -comment "neg sequence  gap count "
acr_ed -create -field x2bm_pcap.FTcp_pair.isn       -arg u32  -write  --comment "initial sequence number (not always from SYN frame)"
acr_ed -create -field x2bm_pcap.FTcp_pair.seq       -arg u32  -write  --comment "current sequence number"
acr_ed -create -field x2bm_pcap.FTcp_pair.seq_next    -arg u32  -write  --comment "running high end of seq+payload"
acr_ed -create -field x2bm_pcap.FTcp_pair.direction     -arg i32  -write  --comment "direction :=1 (for req high->low port)  =2 (for rsp)"
#kafka stats
acr_ed -create -field x2bm_pcap.FTcp_pair.kafka_count   -arg u32  -write  --comment "kafka   count"
acr_ed -create -field x2bm_pcap.FTcp_pair.kafka_len_tot   -arg u32  -write  --comment "total of kafka  length per pair"
acr_ed -create -field x2bm_pcap.FTcp_pair.tcp_payload_len_tot   -arg u32  -write  --comment "total of tcp payload  length per pair"
# kafka detection sliding window
acr_ed -create -field x2bm_pcap.FTcp_pair.swin_buf -arg  u8  -reftype Tary -write     -comment "p to sliding window   buffer "
acr_ed -create -field x2bm_pcap.FTcp_pair.swin_offset    -arg u64            -write     -comment "sliding window offset"

# pointers from above
acr_ed -create -field x2bm_pcap.FDb.zd_tcp_pair -cascdel -write -comment ""

#---------------frame 
acr_ed -create -ctype x2bm_pcap.FFrame -pooltype Tpool -write  -comment "tcp frame entry"
acr_ed -create -field x2bm_pcap.FFrame.p_tcp_pair -arg x2bm_pcap.FTcp_pair -reftype Upptr -write

acr_ed -create -field x2bm_pcap.FFrame.iframe    -arg u64                -write     -comment "global frame number"
acr_ed -create -field x2bm_pcap.FFrame.seq   -arg     u32               -write     -comment "sequence number"
acr_ed -create -field x2bm_pcap.FFrame.seq_gap   -arg i64             -write     -comment "sequence number gap (could be negative)"

acr_ed -create -field x2bm_pcap.FFrame.ack   -arg u32               -write     -comment "ack      number"
acr_ed -create -field x2bm_pcap.FFrame.p_pay -arg  u8  -reftype Tary -write     -comment "p to payload buffer "
acr_ed -create -field x2bm_pcap.FFrame.th_flags -arg  u8             -write     -comment "tcp flags "

#  pointers from above
acr_ed -create -field x2bm_pcap.FTcp_pair.zd_frames -arg x2bm_pcap.FFrame -via x2bm_pcap.FFrame.p_tcp_pair                                 -cascdel -write -comment "double list of frames"
acr_ed -create -field x2bm_pcap.FTcp_pair.bh_frames -arg x2bm_pcap.FFrame -via x2bm_pcap.FFrame.p_tcp_pair  -sortfld x2bm_pcap.FFrame.seq  -cascdel -write -comment "binary heap  of frames"


#-------------kafka client_id entry
acr_ed -create -ctype x2bm_pcap.FClient_id  -pooltype Tpool   -write  -comment "Kafka client entry"
acr_ed -create -field x2bm_pcap.FClient_id.client_id_key -arg algo.Smallstr50  -write  -comment ""
acr_ed -create -field x2bm_pcap.FClient_id.p_tcp_pair -arg x2bm_pcap.FTcp_pair -reftype Upptr -write
#  pointers from above
acr_ed -create -field x2bm_pcap.FTcp_pair.zd_client_id -arg x2bm_pcap.FClient_id -via x2bm_pcap.FClient_id.p_tcp_pair  -cascdel -write -comment "double list of client_id"     
acr_ed -create -field x2bm_pcap.FTcp_pair.ind_client_id -arg x2bm_pcap.FClient_id -via x2bm_pcap.FClient_id.p_tcp_pair  -xref -cascdel -write -comment "index of client_id"     

#-------------kafka req/rsp object
acr_ed -create -ctype x2bm_pcap.FKafka  -pooltype Tpool   -write  -comment "Kafka req/rsp object"
acr_ed -create -field x2bm_pcap.FKafka.kafka_corr_id -arg u32  -write  -comment "correlation_id from hdr"
acr_ed -create -field x2bm_pcap.FKafka.iframe  -arg u32   -write  -comment "iframe of frame where the kafka completed "
acr_ed -create -field x2bm_pcap.FKafka.seq -arg u32   -write  -comment "unused ;? seq of frame where the kafka started"
acr_ed -create -field x2bm_pcap.FKafka.ack -arg u32   -write  -comment "0 intially, =1 when rsp is seen with same corr_id"
acr_ed -create -field x2bm_pcap.FKafka.p_tcp_pair -arg x2bm_pcap.FTcp_pair -reftype Upptr -write  -comment  "tcp pair pointer"
#  pointers from above
acr_ed -create -field x2bm_pcap.FTcp_pair.zd_kafka_corr_id -arg x2bm_pcap.FKafka -via x2bm_pcap.FKafka.p_tcp_pair  -cascdel -write -comment "double list of corr_id"     
acr_ed -create -field x2bm_pcap.FTcp_pair.ind_kafka_corr_id -arg x2bm_pcap.FKafka -via x2bm_pcap.FKafka.p_tcp_pair  -xref -cascdel -write -comment "index of corr_id"     

#  706  acr_ed -create -target xyz -write
#   707  acr_ed -create -ctype xyz.FConn -pooltype Tpool -write
#   708  acr_ed -create -ctype xyz.FReq -pooltype Tpool -write
#   709  acr_ed -create -field xyz.FReq.mykey  -arg u32  -write
#   709  acr_ed -create -field xyz.FReq.p_conn -arg xyz.FConn -reftype Upptr -write
#   710  acr_ed -create -field xyz.FConn.ind_req -arg xyz.FReq -via xyz.FReq.p_conn -xref -write -cascdel

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
amc_vis x2bm_pcap.%   > ~/av_openacr/x2bm_pcap_viz.txt

# ai 

echo "done!!!!!!!!!!!!"