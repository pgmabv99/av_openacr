#!/bin/bash
set -x
set -e

trg=atf_snf

#  by hand
    # dev.targdep  targdep:atf_snf.lib_kafka  comment:""
    #     dev.targdep  targdep:atf_snf.kafka2  comment:""

# one time only !!!!!!!!!!!!!!!!!!
# acr_ed -create -srcfile cpp/atf_snf/parse.cpp -write -comment "parsing frames and kafka req/rsp  "
# acr_ed -create -srcfile cpp/atf_snf/req_rsp.cpp -write -comment "parsing kafka req/rsp payload "
# acr_ed -create -srcfile cpp/atf_snf/utils.cpp -write -comment "utility"


# acr_ed -del -target:atf_snf -write
# acr_ed -create -target:atf_snf -write
# acr_compl -install
# amc

acr_ed -del  -ctype atf_snf.FMcb    -write || true
acr_ed -del  -ctype atf_snf.FTcp_pair -write || true
acr_ed -del  -ctype atf_snf.FClient_id    -write || true
acr_ed -del  -ctype atf_snf.FKafka    -write || true

#  detlete indices from fdb todo
# acr -merge  -write <<EOF
# acr.delete dmmeta.field  field:atf_snf.FDb.ind%
# EOF

# acr_ed -del  -ctype atf_snf.FTcp_pair -write
# acr_ed -del  -ctype atf_snf.FClient_id   -write
# acr_ed -del  -ctype atf_snf.FCorr_id    -write
# acr_ed -del  -ctype atf_snf.FMcb   -write


#--------------tcp pair
# acr_ed -create -ctype atf_snf.FTcp_pair                   -pooltype Tpool       -arg Smallstr50 -indexed -write -comment "tcp pair entry"
acr_ed -create -ctype atf_snf.FTcp_pair                   -pooltype Tpool       -write -comment "tcp pair entry"
acr_ed -create -field atf_snf.FTcp_pair.tcp_pair         -arg algo.Smallstr50        -write -comment "initial sequence number (not always from SYN frame)"
acr_ed -create -field atf_snf.FTcp_pair.isn              -arg u32              -write -comment "initial sequence number (not always from SYN frame)"
acr_ed -create -field atf_snf.FTcp_pair.seq              -arg u32              -write -comment "current sequence number"
acr_ed -create -field atf_snf.FTcp_pair.seq_next         -arg u32              -write -comment "running high end of seq+payload. start of next"
acr_ed -create -field atf_snf.FTcp_pair.seq_gap          -arg i64              -write -comment "sequence number gap with previous frame(could be negative)"
acr_ed -create -field atf_snf.FTcp_pair.direction        -arg i32              -write -comment "direction :=1 (for req high->low port) =2 (for rsp)"
acr_ed -create -field atf_snf.FTcp_pair.tcp_pay_len      -arg i64              -write -comment "tcp pay len for current frame"
acr_ed -create -field atf_snf.FTcp_pair.tsval            -arg u32              -write -comment "ts of current frame in some increasing units from tcp header"
acr_ed -create -field atf_snf.FTcp_pair.ts_ns            -arg u64              -write -comment "ts of current frame in ns from ibv_wc_read_completion_ts or PcapPacketHeader"
acr_ed -create -field atf_snf.FTcp_pair.th_flags         -arg u8               -write -comment "tcp flags of current frame"

# TCP stats
acr_ed -create -field atf_snf.FTcp_pair.frame_count           -arg i32              -write -comment "number of frames for this pair"
acr_ed -create -field atf_snf.FTcp_pair.syn_count             -arg i32              -write -comment "number of syn (connection start)"
acr_ed -create -field atf_snf.FTcp_pair.fin_count             -arg i32              -write -comment "number of fin (connection end)"
acr_ed -create -field atf_snf.FTcp_pair.rst_count             -arg i32              -write -comment "number of rst (connection reset)"
acr_ed -create -field atf_snf.FTcp_pair.seq_gap_pos_count     -arg u32              -write -comment "pos sequence gap count"
acr_ed -create -field atf_snf.FTcp_pair.seq_gap_neg_count     -arg u32              -write -comment "neg sequence gap count"
acr_ed -create -field atf_snf.FTcp_pair.tcp_payload_len_tot   -arg u32              -write -comment "total of tcp payload length per pair"

# Kafka detection sliding window
acr_ed -create -field atf_snf.FTcp_pair.swin_buf              -arg u8               -reftype Tary -write -comment "p to sliding window buffer"
acr_ed -create -field atf_snf.FTcp_pair.swin_offset           -arg u64              -write -comment "sliding window offset"
acr_ed -create -field atf_snf.FTcp_pair.kafka_req_corr_id     -arg u32              -write -comment "latest kafka req corr_id. used to prescreen rsp"

# Kafka stats
acr_ed -create -field atf_snf.FTcp_pair.kafka_count           -arg u32              -write -comment "kafka req or rsp count"
acr_ed -create -field atf_snf.FTcp_pair.kafka_req_ack_count   -arg u32              -write -comment "kafka req ack count"
acr_ed -create -field atf_snf.FTcp_pair.kafka_len_tot         -arg u32              -write -comment "total of kafka req/rsp length per pair"
acr_ed -create -field atf_snf.FTcp_pair.kafka_per_frame_count -arg u32              -write -comment "count of kafka req/rsp per frame"

# pointers from above
# acr_ed -del  -field atf_snf.FDb.zd_tcp_pair                    -write  
acr_ed -create -field atf_snf.FDb.zd_tcp_pair             -cascdel              -write -comment ""
acr_ed -create -field atf_snf.FDb.ind_tcp_pair            -cascdel              -write -comment ""

#-------------kafka client_id entry
acr_ed -create -ctype atf_snf.FClient_id          -pooltype Tpool       -write  -comment "Kafka client entry"
acr_ed -create -field  atf_snf.FClient_id.client_id_key -arg algo.Smallstr50 -write  -comment ""
acr_ed -create -field  atf_snf.FClient_id.p_tcp_pair    -arg atf_snf.FTcp_pair -reftype Upptr -write
#  pointers from above
acr_ed -create -field  atf_snf.FTcp_pair.zd_client_id   -arg atf_snf.FClient_id -via atf_snf.FClient_id.p_tcp_pair -cascdel -write -comment "double list of client_id"
acr_ed -create -field  atf_snf.FTcp_pair.ind_client_id  -arg atf_snf.FClient_id -via atf_snf.FClient_id.p_tcp_pair -xref -cascdel -write -comment "index of client_id"

#-------------kafka req/rsp object
acr_ed -create -ctype atf_snf.FKafka                   -pooltype Tpool       -write  -comment "Kafka req/rsp object"
acr_ed -create -field atf_snf.FKafka.kafka_corr_id     -arg u32              -write  -comment "correlation_id from hdr"
acr_ed -create -field atf_snf.FKafka.api_version       -arg u32              -write  -comment "req api_version"
acr_ed -create -field atf_snf.FKafka.kafka_len         -arg u32              -write  -comment "len of req/rsp w/o 4"
acr_ed -create -field atf_snf.FKafka.iframe            -arg u32              -write  -comment "iframe of frame where the kafka req/rsp completed"
acr_ed -create -field atf_snf.FKafka.seq               -arg u32              -write  -comment "unused; seq of frame where the kafka started"
acr_ed -create -field atf_snf.FKafka.index_in_frame    -arg u32              -write  -comment "index of kafka req/rsp in its frame"
acr_ed -create -field atf_snf.FKafka.ack               -arg u32              -write  -comment "0 initially, =1 when rsp is seen with same corr_id"
acr_ed -create -field atf_snf.FKafka.api_key           -arg u32              -write  -comment "kafka api key"
acr_ed -create -field atf_snf.FKafka.ts_ns             -arg u64              -write  -comment "ts of last or only frame that completed kafka req/rsp, in ns"
acr_ed -create -field atf_snf.FKafka.round_trip_dur    -arg u64              -write  -comment "duration dif between rsp and req"
acr_ed -create -field atf_snf.FKafka.ts_order          -arg bool             -write  -comment "true if req is before rsp"
acr_ed -create -field atf_snf.FKafka.mon_step_n        -arg u64              -write  -comment "number of mon step at creation time"
acr_ed -create -field atf_snf.FKafka.kafka_buf         -arg u8               -reftype Tary -write -comment "ptr to kafka   buffer  on each pair"
acr_ed -create -field atf_snf.FKafka.kafka_rsp         -arg atf_snf.FKafka   -reftype Ptr   -write  -comment "ptr from kafka req to  kafka rsp obj "
# pointers from up/down
acr_ed -create -field atf_snf.FKafka.p_tcp_pair        -arg atf_snf.FTcp_pair   -reftype Upptr -write  -comment "tcp pair pointer"
acr_ed -create -field atf_snf.FTcp_pair.p_cur_kafka    -arg atf_snf.FKafka   -reftype Ptr   -write  -comment "current kafka obj being built"
# lists
acr_ed -create -field atf_snf.FTcp_pair.zd_kafka_obsolete  -arg atf_snf.FKafka   -via atf_snf.FKafka.p_tcp_pair -inscond:false -cascdel -write -comment "temp list of kafka objects to be deleted"
acr_ed -create -field atf_snf.FTcp_pair.ind_kafka_corr_id  -arg atf_snf.FKafka   -via atf_snf.FKafka.p_tcp_pair -xref -cascdel -write -comment "index of corr_id"
acr_ed -create -field atf_snf.FTcp_pair.bh_kafka_corr_id   -arg atf_snf.FKafka   -via atf_snf.FKafka.p_tcp_pair -sortfld atf_snf.FKafka.ts_ns -cascdel -write -comment "bheap of kafka on ts_ns"


#-------------main CB
acr_ed -create -ctype atf_snf.FMcb                              -write -comment "Main CB"

# stats
acr_ed -create -field atf_snf.FMcb.iframe                      -arg u64              -write -comment "global iframe index including non-tcp. start at 1"
acr_ed -create -field atf_snf.FMcb.kafka_req_count_total       -arg u64              -write -comment "total kafka req count"
acr_ed -create -field atf_snf.FMcb.kafka_req_ack_count_total   -arg u64              -write -comment "total kafka req ack count"
acr_ed -create -field atf_snf.FMcb.max_pkt_len                 -arg u32              -write -comment "maximum packet length"
acr_ed -create -field atf_snf.FMcb.time0                       -arg algo.SchedTime   -write -comment "starting time"
acr_ed -create -field atf_snf.FMcb.round_trip_dur_tot          -arg u64              -write -comment "total accumulated round-trip duration"
acr_ed -create -field atf_snf.FMcb.mon_step_n                  -arg u64              -write -comment "number of latest mon step run"
acr_ed -create -field atf_snf.FMcb.snf                         -arg atf_snf.FSnf     -reftype Ptr  -write -comment "pointer to snf"
acr_ed -create -field atf_snf.FMcb.fd_out_file                 -arg i32              -write -comment ""
acr_ed -create -field atf_snf.FMcb.i_kafka_solo                -arg i32              -write -comment "index of kafka req/rsp pair solo generation"
acr_ed -create -field atf_snf.FMcb.kafka_solo_err_count        -arg i32              -write -comment "count of solo generation errors"
acr_ed -create -field atf_snf.FMcb.seq_gap_pos_count           -arg u32              -write -comment "pos sequence gap count"
acr_ed -create -field atf_snf.FMcb.seq_gap_neg_count           -arg u32              -write -comment "neg sequence gap count"

# debug
acr_ed -create -field atf_snf.FMcb.mac_print_flg               -arg bool             -write -comment "print MAC info at parse"
acr_ed -create -field atf_snf.FMcb.swin_print_flg              -arg bool             -write -comment "print sliding window"
acr_ed -create -field atf_snf.FMcb.tcp_pair_list_print_flg     -arg bool             -write -comment "print tcp pair"
acr_ed -create -field atf_snf.FMcb.kafka_list_print_flg        -arg bool             -write -comment "print outstanding kafka req/rsp lists"
acr_ed -create -field atf_snf.FMcb.tcp_filter                  -arg bool             -write -comment "apply tcp filter for debugging "
acr_ed -create -field atf_snf.FMcb.snf_memqp_print_flg         -arg bool             -write -comment "print memqp print"

# acr_ed -create -field atf_snf.FMcb.cap_solo                    -arg bool             -write -comment "capture each solo  kafka req/rsp to separate file"

# include into _db
acr_ed -del    -field atf_snf.FDb.mcb                          -write
acr_ed -create -field atf_snf.FDb.mcb                          -arg atf_snf.FMcb        -write -comment ""

#----------FDb  steps
acr_ed -del    -field atf_snf.FDb.snf_poll                     -write || true
acr_ed -create -field atf_snf.FDb.snf_poll                     -arg bool             -write -comment "step field for snf polling loop"
acr -merge -write <<EOF
    dmmeta.fstep  fstep:atf_snf.FDb.snf_poll steptype:Inline  comment:"should be without delay"
EOF

acr_ed -del    -field atf_snf.FDb.snf_clean                     -write || true
acr_ed -create -field atf_snf.FDb.snf_clean                     -arg bool             -write -comment "step field for cleaning old or completed kafka req/rsp"
acr -merge -write <<EOF
    dmmeta.fstep   fstep:atf_snf.FDb.snf_clean   steptype:InlineRecur  comment:""
    dmmeta.fdelay  fstep:atf_snf.FDb.snf_clean   delay:1.000000000  scale:N  comment:""
EOF

acr_ed -del    -field atf_snf.FDb.snf_mon                       -write || true
acr_ed -create -field atf_snf.FDb.snf_mon                       -arg bool             -write -comment "step field for monitor"
acr -merge -write <<EOF
    dmmeta.fstep   fstep:atf_snf.FDb.snf_mon   steptype:InlineRecur  comment:""
    dmmeta.fdelay  fstep:atf_snf.FDb.snf_mon   delay:1.000000000  scale:N  comment:""
EOF

#  set parms for atf_snf
acr -merge  -write <<EOF
acr.delete dmmeta.field  field:command.atf_snf.kapi
acr.delete dmmeta.field  field:command.atf_snf.in_file
acr.delete dmmeta.field  field:command.atf_snf.in_solo_dir
acr.delete dmmeta.field  field:command.atf_snf.out_solo_dir
acr.delete dmmeta.field  field:command.atf_snf.out_file
acr.delete dmmeta.field  field:command.atf_snf.dir
acr.delete dmmeta.field  field:command.atf_snf.mult_req_per_frame
EOF
acr -merge -write <<EOF
    dmmeta.field  field:command.atf_snf.kapi                   arg:bool          reftype:Val      dflt:false        comment:"invoke tcp header and kafka parse code"
    dmmeta.field  field:command.atf_snf.in_file                arg:algo.cstring  reftype:Val      dflt:'""'  comment:"input PCAP file under dir. empty for live NIC capture"
    dmmeta.field  field:command.atf_snf.in_solo_dir            arg:algo.cstring  reftype:Val      dflt:'""'  comment:"input folder under dir for solo req files. empty for live NIC capture"
    dmmeta.field  field:command.atf_snf.out_solo_dir           arg:algo.cstring  reftype:Val      dflt:'""'  comment:"output folder under dir for solo req files. empty to skip creation of solo files"
    dmmeta.field  field:command.atf_snf.out_file               arg:algo.cstring  reftype:Val      dflt:'""'  comment:"output PCAP file under dir to shadow pkts. empty for no shadow"
    dmmeta.field  field:command.atf_snf.dir                    arg:algo.cstring  reftype:Val      dflt:'"/home/avorovich/pcap/"'  comment:"dir for in and out files"
    dmmeta.field  field:command.atf_snf.mult_req_per_frame     arg:bool          reftype:Val      dflt:true        comment:"parse mode: true - multiple req/rsp are expected per frame"
EOF


# include port config file
acr_ed -del    -ctype atf_snf.FDctrport                          -write || true
acr_ed -create -finput -target atf_snf   -ssimfile dkrdb.dctrport  -write -comment "inherited from ssimfile"
acr_ed -del    -field atf_snf.FDb.ind_uid                        -write || true
acr_ed -create -field atf_snf.FDb.ind_uid  -arg atf_snf.FDctrport -hashfld dkrdb.Dctrport.uid -xref -write -comment ""
acr_ed -del    -field atf_snf.FDb.zd_dctrport                     -write || true
acr_ed -create -field atf_snf.FDb.zd_dctrport                    -arg atf_snf.FDctrport -xref -write -comment ""

# force reading of dkrdb.dctrport
acr -merge -write <<EOF 
    dmmeta.floadtuples  field:command.atf_snf.in  comment:""   
EOF
# -dmmeta.funique  field:dkrdb.Dctrport.dctrport  comment:""
# +dmmeta.funique  field:dkrdb.Dctrport.uid  comment:""

amc
amc_vis atf_snf.%   > ~/av_openacr/${trg}_viz.txt

# ai

echo "done!!!!!!!!!!!!"
