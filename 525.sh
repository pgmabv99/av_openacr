#!/bin/bash
set -x
set -e

trg=${1:-x2bm_pcap}
cd $HOME/arnd

# acr_ed -del -target:$trg -write 
# acr_ed -create -target:$trg -write 
# acr_compl -install
# amc

acr_ed -del  -ctype $trg.FMcb    -write || true
acr_ed -del  -ctype $trg.FTcp_pair -write || true
acr_ed -del  -ctype $trg.FFrame     -write || true
acr_ed -del  -ctype $trg.FClient_id    -write || true
acr_ed -del  -ctype $trg.FKafka    -write || true
# acr_ed -del  -ctype $trg.FTcp_pair -write 
# acr_ed -del  -ctype $trg.FFrame     -write 
# acr_ed -del  -ctype $trg.FClient_id   -write 
# acr_ed -del  -ctype $trg.FCorr_id    -write 
# acr_ed -del  -ctype $trg.FMcb   -write 


#--------------tcp pair
acr_ed -create -ctype $trg.FTcp_pair -pooltype Tpool -arg Smallstr50 -indexed -write -comment "tcp pair entry"
acr_ed -create -field $trg.FTcp_pair.isn               -arg u32 -write -comment "initial sequence number (not always from SYN frame)"
acr_ed -create -field $trg.FTcp_pair.seq               -arg u32 -write -comment "current sequence number"
acr_ed -create -field $trg.FTcp_pair.seq_next          -arg u32 -write -comment "running high end of seq+payload. start of next"
acr_ed -create -field $trg.FTcp_pair.seq_gap           -arg i64 -write -comment "sequence number gap with previous frame(could be negative)"

acr_ed -create -field $trg.FTcp_pair.direction         -arg i32 -write -comment "direction :=1 (for req high->low port) =2 (for rsp)"
acr_ed -create -field $trg.FTcp_pair.tcp_pay_len       -arg i64 -write -comment "tcp pay len for current frame"
acr_ed -create -field $trg.FTcp_pair.tsval             -arg u32 -write -comment "timestamp value of current frame"
acr_ed -create -field  $trg.FTcp_pair.th_flags              -arg u8                 -write -comment "tcp flags of current frame"

# TCP stats
acr_ed -create -field $trg.FTcp_pair.frame_count       -arg i32 -write -comment "number of frames for this pair"
acr_ed -create -field $trg.FTcp_pair.syn_count         -arg i32 -write -comment "number of syn (connection start)"
acr_ed -create -field $trg.FTcp_pair.fin_count         -arg i32 -write -comment "number of fin (connection end)"
acr_ed -create -field $trg.FTcp_pair.rst_count         -arg i32 -write -comment "number of rst (connection reset)"
acr_ed -create -field $trg.FTcp_pair.seq_gap_pos_count -arg u32 -write -comment "pos sequence gap count"
acr_ed -create -field $trg.FTcp_pair.seq_gap_neg_count -arg u32 -write -comment "neg sequence gap count"
acr_ed -create -field $trg.FTcp_pair.tcp_payload_len_tot -arg u32 -write -comment "total of tcp payload length per pair"
# kafka detection sliding window
acr_ed -create -field $trg.FTcp_pair.swin_buf          -arg u8  -reftype Tary -write -comment "p to sliding window buffer"
acr_ed -create -field $trg.FTcp_pair.swin_offset       -arg u64 -write -comment "sliding window offset"
acr_ed -create -field $trg.FTcp_pair.kafka_req_corr_id -arg u32 -write -comment "latest kafka req corr_id. used to prescreen rsp"
# kafka stats
acr_ed -create -field $trg.FTcp_pair.kafka_count       -arg u32 -write -comment "kafka req/rsp count"
acr_ed -create -field $trg.FTcp_pair.kafka_non_ack_count -arg u32 -write -comment "kafka req non ack count"
acr_ed -create -field $trg.FTcp_pair.kafka_len_tot     -arg u32 -write -comment "total of kafka req/rsp length per pair"
acr_ed -create -field $trg.FTcp_pair.kafka_per_frame_count   -arg u32 -write -comment "count of kafka req/rsp per frame"
# pointers from above
acr_ed -create -field $trg.FDb.zd_tcp_pair -cascdel -write -comment ""


#---------------frame 
acr_ed -create -ctype $trg.FFrame          -pooltype Tpool       -write  -comment "tcp frame entry"
acr_ed -create -field  $trg.FFrame.p_tcp_pair -arg $trg.FTcp_pair -reftype Upptr -write

acr_ed -create -field  $trg.FFrame.iframe    -arg u64                -write -comment "global frame number"
acr_ed -create -field  $trg.FFrame.seq       -arg u32                -write -comment "sequence number/ used in hash"
acr_ed -create -field  $trg.FFrame.p_pay     -arg u8  -reftype Tary  -write -comment "p to payload buffer"

#  pointers from above
acr_ed -create -field  $trg.FTcp_pair.zd_frames -arg $trg.FFrame -via $trg.FFrame.p_tcp_pair -cascdel -write -comment "double list of frames"
acr_ed -create -field  $trg.FTcp_pair.bh_frames -arg $trg.FFrame -via $trg.FFrame.p_tcp_pair -sortfld $trg.FFrame.seq -cascdel -write -comment "binary heap of frames"

#-------------kafka client_id entry
acr_ed -create -ctype $trg.FClient_id          -pooltype Tpool       -write  -comment "Kafka client entry"
acr_ed -create -field  $trg.FClient_id.client_id_key -arg algo.Smallstr50 -write  -comment ""
acr_ed -create -field  $trg.FClient_id.p_tcp_pair    -arg $trg.FTcp_pair -reftype Upptr -write
#  pointers from above
acr_ed -create -field  $trg.FTcp_pair.zd_client_id   -arg $trg.FClient_id -via $trg.FClient_id.p_tcp_pair -cascdel -write -comment "double list of client_id"     
acr_ed -create -field  $trg.FTcp_pair.ind_client_id  -arg $trg.FClient_id -via $trg.FClient_id.p_tcp_pair -xref -cascdel -write -comment "index of client_id"     

#-------------kafka req/rsp object
acr_ed -create -ctype $trg.FKafka               -pooltype Tpool       -write  -comment "Kafka req/rsp object"
acr_ed -create -field  $trg.FKafka.kafka_corr_id -arg u32             -write  -comment "correlation_id from hdr"
acr_ed -create -field  $trg.FKafka.kafka_len     -arg u32             -write  -comment "len of req/rsp w/o 4"
acr_ed -create -field  $trg.FKafka.iframe        -arg u32             -write  -comment "iframe of frame where the kafka completed "
acr_ed -create -field  $trg.FKafka.seq           -arg u32             -write  -comment "unused ;? seq of frame where the kafka started"
acr_ed -create -field  $trg.FKafka.index_in_frame   -arg u32             -write  -comment "index of kafka req/rsp in it's frame"
acr_ed -create -field  $trg.FKafka.ack           -arg u32             -write  -comment "0 intially, =1 when rsp is seen with same corr_id"
acr_ed -create -field  $trg.FKafka.p_tcp_pair    -arg $trg.FTcp_pair -reftype Upptr -write  -comment  "tcp pair pointer"
#  pointers from above
acr_ed -create -field  $trg.FTcp_pair.zd_kafka_corr_id -arg $trg.FKafka -via $trg.FKafka.p_tcp_pair -cascdel -write -comment "double list of corr_id"     
acr_ed -create -field  $trg.FTcp_pair.ind_kafka_corr_id -arg $trg.FKafka -via $trg.FKafka.p_tcp_pair -xref -cascdel -write -comment "index of corr_id"     

# #-------------main CB
acr_ed -create -ctype $trg.FMcb                              -write -comment "Main CB"
# stats
acr_ed -create -field $trg.FMcb.pkt_count                   -arg u32  -write -comment "global pkt count including non-tcp"
acr_ed -create -field $trg.FMcb.max_pkt_len                 -arg u32  -write -comment "max pkt len"
acr_ed -create -field $trg.FMcb.kafka_count_total           -arg u32  -write -comment ""
acr_ed -create -field $trg.FMcb.kafka_non_ack_count_total   -arg u32  -write -comment ""
# debug
acr_ed -create -field $trg.FMcb.mac_print_flg               -arg bool -write -comment "debug mac"
acr_ed -create -field $trg.FMcb.frame_print_flg             -arg bool -write -comment "debug frame"
acr_ed -create -field $trg.FMcb.kafka_print_flg             -arg bool -write -comment "debug kafka"
acr_ed -create -field $trg.FMcb.swin_print_flg              -arg bool -write -comment "debug sliding window"
acr_ed -create -field $trg.FMcb.kafka_pair_final_print_flg  -arg bool -write -comment "debug kafka pair final"
#  include into _db
acr_ed -del -field $trg.FDb.mcb -write
acr_ed -create -field $trg.FDb.mcb  -arg  $trg.FMcb  -write -comment ""

#  set parms for $trg
acr -merge  -write <<EOF
acr.delete dmmeta.field  field:command.$trg.use_files  
acr.delete dmmeta.field  field:command.$trg.files  
acr.delete dmmeta.field  field:command.$trg.dir     
acr.delete dmmeta.field  field:command.$trg.mult_req_per_frame
EOF
acr -merge -write <<EOF
dmmeta.field  field:command.$trg.files  arg:algo.cstring  reftype:RegxSql  dflt:'"%0%"'  comment:"Regx of file(s) to test"
dmmeta.field  field:command.$trg.dir   arg:algo.cstring  reftype:Val       dflt:'"/home/avorovich/pcap/"'  comment:"dir with file(s) to test"
dmmeta.field  field:command.$trg.mult_req_per_frame   arg:bool  reftype:Val       dflt:true  comment:"parse mode: true multiple req/rsp are exepcted per frame"
dmmeta.field  field:command.$trg.use_files   arg:bool  reftype:Val       dflt:false comment:"true -  read static pcap. false - live sniffer"
EOF



amc
amc_vis $trg.%   > ~/av_openacr/${trg}_viz.txt

# ai 

echo "done!!!!!!!!!!!!"