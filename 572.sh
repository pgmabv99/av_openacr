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
acr_ed -del  -ctype atf_snf.FMcb         -write || true
acr_ed -del  -ctype atf_snf.FClient_id   -write || true
acr_ed -del  -ctype atf_snf.FKafka       -write || true


#  detlete indices from fdb todo
# acr -merge  -write <<EOF
# acr.delete dmmeta.field  field:atf_snf.FDb.ind%
# EOF

# acr_ed -del  -ctype atf_snf.FTcp_pair -write
# acr_ed -del  -ctype atf_snf.FClient_id   -write
# acr_ed -del  -ctype atf_snf.FCorr_id    -write
# acr_ed -del  -ctype atf_snf.FMcb   -write


#--------------tcp pair
set -e
acr_ed -del  -ctype atf_snf.FTcp_pair    -write || true
acr_ed -create -ctype atf_snf.FTcp_pair                   -pooltype Tpool       -write -comment "tcp pair entry"
acr_ed -create -field atf_snf.FTcp_pair.tcp_pair         -arg algo.Smallstr50        -write -comment "tcp pair string key host:port-host:port"
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
acr_ed -create -field atf_snf.FTcp_pair.kafka_count           -arg u32              -write -comment "kafka req or rsp count. cum per tcp pair"
acr_ed -create -field atf_snf.FTcp_pair.kafka_req_ack_count   -arg u32              -write -comment "kafka req ack count"
acr_ed -create -field atf_snf.FTcp_pair.kafka_len_tot         -arg u32              -write -comment "total of kafka req/rsp length per pair"
acr_ed -create -field atf_snf.FTcp_pair.kafka_per_frame_count -arg u32              -write -comment "count of kafka req/rsp per frame"
acr_ed -create -field atf_snf.FTcp_pair.kafka_lat_tot_per_step -arg u64              -write -comment "sum of  latencies  per step"
acr_ed -create -field atf_snf.FTcp_pair.kafka_lat_max_per_step -arg u64              -write -comment "maxof  latencies  per step"
acr_ed -create -field atf_snf.FTcp_pair.kafka_lat_min_per_step -arg u64              -write -comment "min of  latencies  per step"
acr_ed -create -field atf_snf.FTcp_pair.kafka_count_per_step  -arg u64              -write -comment "count of kafa req per step"
acr_ed -create -field atf_snf.FTcp_pair.kafka_prod_msg_count_per_step  -arg u64              -write -comment "produce msg count per step. across all paritions"
acr_ed -create -field atf_snf.FTcp_pair.kafka_fetch_msg_lat_tot_per_step  -arg u64              -write -comment "fetch msg total fetch latency. host_time - max_timestamp"
acr_ed -create -field atf_snf.FTcp_pair.kafka_fetch_msg_count_per_step  -arg u64              -write -comment "fetch msg count per step. across all partitions"

#x2 stats
acr_ed -create -field atf_snf.FTcp_pair.x2msg_count           -arg u32              -write -comment "x2 msg . only read.In_Seqmsg"

# pointers from above
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
# acr_ed -create -field atf_snf.FTcp_pair.bh_kafka_corr_id   -arg atf_snf.FKafka   -via atf_snf.FKafka.p_tcp_pair -sortfld atf_snf.FKafka.ts_ns -cascdel -write -comment "bheap of kafka on ts_ns"
acr_ed -create -field atf_snf.FTcp_pair.bh_kafka_corr_id   -arg atf_snf.FKafka   -via atf_snf.FKafka.p_tcp_pair -sortfld atf_snf.FKafka.iframe -cascdel -write -comment "bheap of kafka on ts_ns"

# pointers
acr_ed -del  -field atf_snf.FDb.bh_ts_ns -write || true
acr_ed -create -field atf_snf.FDb.bh_ts_ns -xref  -arg atf_snf.FKafka -sortfld atf_snf.FKafka.ts_ns -write -comment "bheap of kafka on ts_ns from FDB"

#--------
#-------------extract objects
acr_ed -del    -ctype atf_snf.FTopNameId                                              -write || true
acr_ed -create -ctype atf_snf.FTopNameId                           -pooltype Tpool                  -write  -comment "Topic"
acr_ed -create -field atf_snf.FTopNameId.topic                     -arg algo.Smallstr100            -write  -comment "topic name"
acr_ed -create -field atf_snf.FTopNameId.topic_id                  -arg algo.Smallstr100            -write  -comment "topic id"
# pointers from up/down above
acr_ed -del    -field atf_snf.FDb.bh_top_name_id                         -write || true""
acr_ed -create -field atf_snf.FDb.bh_top_name_id   -xref  -arg  atf_snf.FTopNameId   -sortfld   atf_snf.FTopNameId.topic_id             -cascdel              -write -comment ""
acr_ed -del    -field atf_snf.FDb.ind_top_name_id                  -write || true""
acr_ed -create -field atf_snf.FDb.ind_top_name_id  -xref  -arg  atf_snf.FTopNameId   -hashfld   atf_snf.FTopNameId.topic_id             -cascdel              -write -comment ""
amc

set -e
acr_ed -del    -ctype atf_snf.FToppart                                              -write || true
acr_ed -create -ctype atf_snf.FToppart                           -pooltype Tpool                      -write  -comment "Topic/partition"
acr_ed -create -field atf_snf.FToppart.toppart                       -arg algo.Smallstr100            -write  -comment "topic id/partion id"
acr_ed -create -field atf_snf.FToppart.type                          -arg u32                         -write  -comment "=1 fetch  offset, 2= produce offsets"
acr_ed -create -field atf_snf.FToppart.topic_name                    -arg algo.Smallstr100            -write  -comment "topic name"
acr_ed -create -field atf_snf.FToppart.offset_produce                -arg i64                         -write  -comment "latest produce offset"
acr_ed -create -field atf_snf.FToppart.offset_produce_last           -arg i64                         -write  -comment "last   produce offset"
acr_ed -create -field atf_snf.FToppart.offset_fetch_fst              -arg i64                         -write  -comment "latest fetch offset. first in batch"
acr_ed -create -field atf_snf.FToppart.offset_fetch_lst              -arg i64                         -write  -comment "latest fetch offset. last in batch"
acr_ed -create -field atf_snf.FToppart.high_watermark                -arg i64                         -write  -comment "high watermark"
# pointers from up/down above
acr_ed -create -field atf_snf.FDb.bh_toppart                -cascdel              -write -comment ""
acr_ed -create -field atf_snf.FDb.ind_toppart               -cascdel              -write -comment ""
amc

# -

#-------------x2req object. 
set -e
acr_ed -del    -ctype atf_snf.FX2req                                              -write || true
acr_ed -create -ctype atf_snf.FX2req                        -pooltype Tpool       -write  -comment "x2 req.Created on UGPubMsg , destroyed on GUAckMsg"
acr_ed -create -field atf_snf.FX2req.key                    -arg algo.Smallstr100 -write  -comment "tcp_pair_key/stream_id/request_id "
acr_ed -create -field atf_snf.FX2req.ts_snf_w               -arg u64              -write  -comment "ts of the snf write UGPubMsg "
# pointers from up/down above
acr_ed -create -field atf_snf.FDb.zd_x2req                  -cascdel              -write -comment " for debugging"
acr_ed -create -field atf_snf.FDb.ind_x2req                 -cascdel              -write -comment ""

#-------------x2seq object. Oner per seq (creat over loop seq_beg to seq_end)
set -e
acr_ed -del    -ctype atf_snf.FX2seq                                              -write || true
acr_ed -create -ctype atf_snf.FX2seq                        -pooltype Tpool       -write  -comment "x2 seq.Created on GUAckMsg , destroyed on In_Seqmsg"
acr_ed -create -field atf_snf.FX2seq.key                    -arg algo.Smallstr100 -write  -comment "stream_id/seq"
acr_ed -create -field atf_snf.FX2seq.ts_snf_w               -arg u64              -write  -comment "ts of the snf write UGPubMsg "
# pointers from up/down above
acr_ed -create -field atf_snf.FDb.zd_x2seq                  -cascdel              -write -comment " for debugging"
acr_ed -create -field atf_snf.FDb.ind_x2seq                 -cascdel              -write -comment ""

#-------------main CB
set -e
acr_ed -del    -ctype atf_snf.FMcb                              -write  || true
acr_ed -create -ctype atf_snf.FMcb                              -write -comment "Main CB"
# stats
acr_ed -create -field atf_snf.FMcb.iframe                      -arg u64               -write -comment "global iframe index including non-tcp. start at 1"
acr_ed -create -field atf_snf.FMcb.kafka_req_count_total       -arg u64               -write -comment "total kafka req count"
acr_ed -create -field atf_snf.FMcb.kafka_req_ack_count_total   -arg u64               -write -comment "total kafka req ack count"
acr_ed -create -field atf_snf.FMcb.kafka_rsp_wo_req            -arg u64               -write -comment "total kafka rsp without req count"
acr_ed -create -field atf_snf.FMcb.max_pkt_len                 -arg u32               -write -comment "maximum packet length"
acr_ed -create -field atf_snf.FMcb.time0                       -arg algo.SchedTime    -write -comment "starting time"
acr_ed -create -field atf_snf.FMcb.round_trip_dur_tot          -arg u64               -write -comment "total accumulated round-trip duration"
acr_ed -create -field atf_snf.FMcb.mon_step_n                  -arg u64               -write -comment "number of latest mon step run"
acr_ed -create -field atf_snf.FMcb.snf                         -arg atf_snf.FSnf      -reftype Ptr   -write -comment "pointer to snf"
acr_ed -create -field atf_snf.FMcb.fd_out_pcap_file            -arg i32               -dflt:-1       -write -comment "" 
acr_ed -create -field atf_snf.FMcb.i_kafka_solo                -arg i32               -write -comment "index of kafka req/rsp pair solo generation"
acr_ed -create -field atf_snf.FMcb.kafka_solo_err_count        -arg i32               -write -comment "count of solo generation errors"
acr_ed -create -field atf_snf.FMcb.seq_gap_pos_count           -arg u32               -write -comment "pos sequence gap count"
acr_ed -create -field atf_snf.FMcb.seq_gap_neg_count           -arg u32               -write -comment "neg sequence gap count"
acr_ed -create -field atf_snf.FMcb.exper_dir                   -arg algo.Smallstr100  -write -comment "experiment directory"
acr_ed -create -field atf_snf.FMcb.test_dirs                   -arg algo.Smallstr100  -write -comment "test directories"
acr_ed -create -field atf_snf.FMcb.tcp_pairs_dir               -arg algo.Smallstr100  -write -comment "tcp pairs directories"
acr_ed -create -field atf_snf.FMcb.fd_tcp_pairs_all_log        -arg i32               -write -comment "fd for tcp pairs all log"
acr_ed -create -field atf_snf.FMcb.iframe_written              -arg u32               -write -comment "last iframe written to  all log"
acr_ed -create -field atf_snf.FMcb.p_cur_tcp_pair              -arg atf_snf.FTcp_pair  -reftype Ptr   -write  -comment "current tcp_pair being processed"

# debug
acr_ed -create -field atf_snf.FMcb.mac_print_flg               -arg bool             -write -comment "print MAC info at parse"
acr_ed -create -field atf_snf.FMcb.swin_print_flg              -arg bool             -write -comment "print sliding window"
acr_ed -create -field atf_snf.FMcb.tcp_pair_list_print_flg     -arg bool             -write -comment "print tcp pair"
acr_ed -create -field atf_snf.FMcb.tcp_filter                  -arg bool             -write -comment "apply tcp filter for debugging "
acr_ed -create -field atf_snf.FMcb.snf_memqp_print_flg         -arg bool             -write -comment "print memqp print"
# acr_ed -create -field atf_snf.FMcb.snf_memqp_ping_pong         -arg bool             -write -comment "if true use ping pong 2 pools. if false use single pool/standlone WQ"



#X2 calibration 
acr_ed -create -field atf_snf.FMcb.ts_snf_w_last                 -arg u64      -write  -comment "ts of the snf write UGPubMsg (last)"
acr_ed -create -field atf_snf.FMcb.ts_snf_w_crnt                 -arg u64      -write  -comment "ts of the snf write UGPubMsg (current)"
acr_ed -create -field atf_snf.FMcb.ts_local_last                 -arg algo.UnTime      -write  -comment "ts local time (last)"
acr_ed -create -field atf_snf.FMcb.ts_local_crnt                 -arg algo.UnTime      -write  -comment "ts local time (current)"

acr_ed -create -field atf_snf.FMcb.poll_count                     -arg u64               -write -comment "count of snf poll calls"
acr_ed -create -field atf_snf.FMcb.poll_hit_count                 -arg u64               -write -comment "count of snf poll at last hit"
acr_ed -create -field atf_snf.FMcb.poll_hit_delta_max              -arg u64               -write -comment ""
acr_ed -create -field atf_snf.FMcb.poll_hit_delta_min              -arg u64               -write -comment ""
acr_ed -create -field atf_snf.FMcb.poll_hit_delta_cum              -arg u64               -write -comment "for avg calc"
acr_ed -create -field atf_snf.FMcb.poll_hit_delta1_count           -arg u64               -write -comment "count of delta=1"

acr_ed -create -field atf_snf.FMcb.delta_last                      -arg u64               -write -comment "count of delta=1"
acr_ed -create -field atf_snf.FMcb.delta1_run_cur_len              -arg u64               -write -comment "length of cureent delta1 run"
acr_ed -create -field atf_snf.FMcb.delta1_run_count                -arg u64               -write -comment "count of delta1 runs"
acr_ed -create -field atf_snf.FMcb.delta1_run_len_total            -arg u64               -write -comment "total length  delta1 runs"
acr_ed -create -field atf_snf.FMcb.delta1_run_len_max              -arg u64               -write -comment "max length  of delta1 runs"
acr_ed -create -field atf_snf.FMcb.delta1_hist5                    -arg u32               -write -comment "histogram bin for delta1 runs len <5"
acr_ed -create -field atf_snf.FMcb.delta1_hist50                    -arg u32               -write -comment "histogram bin for delta1 runs len <50"
acr_ed -create -field atf_snf.FMcb.delta1_hist500                 -arg u32               -write -comment "histogram bin for delta1 runs len <500"
acr_ed -create -field atf_snf.FMcb.delta1_hist5000                 -arg u32               -write -comment "histogram bin for delta1 runs len <5000"
acr_ed -create -field atf_snf.FMcb.delta1_histmax                  -arg u32               -write -comment "histogram bin for delta1 runs len <max"



acr_ed -create -field atf_snf.FMcb.kapi_parse_dur_total            -arg u64               -write -comment "total duration spent in kapi parse"



# include  atf_snf.FMcb into _db
acr_ed -del    -field atf_snf.FDb.mcb                          -write
acr_ed -create -field atf_snf.FDb.mcb                          -arg atf_snf.FMcb        -write -comment ""
# -------------------
# include omdb.OmTapHostinto _db
acr_ed -del    -field atf_snf.FDb.om_tap_host                           -write
acr_ed -create -field atf_snf.FDb.om_tap_host                           -arg omdb.OmTapHost       -write -comment ""



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
acr.delete dmmeta.field  field:command.atf_snf.x2
acr.delete dmmeta.field  field:command.atf_snf.sll2
acr.delete dmmeta.field  field:command.atf_snf.trafmsg 
acr.delete dmmeta.field  field:command.atf_snf.in_file
acr.delete dmmeta.field  field:command.atf_snf.dir
acr.delete dmmeta.field  field:command.atf_snf.mult_req_per_frame
acr.delete dmmeta.field  field:command.atf_snf.hex_print
EOF
acr -merge -write <<EOF
    dmmeta.field  field:command.atf_snf.kapi                   arg:bool          reftype:Val      dflt:false        comment:"parse  tcp header and kafka "
    dmmeta.field  field:command.atf_snf.x2                     arg:bool          reftype:Val      dflt:false        comment:"parse  tcp header and x2"
    dmmeta.field  field:command.atf_snf.trafmsg                arg:bool          reftype:Val      dflt:false        comment:"interpret x2 msg in trafmsg mode"
    dmmeta.field  field:command.atf_snf.sll2                   arg:bool          reftype:Val      dflt:false        comment:"set true for lochost capture with sll2 header"
    dmmeta.field  field:command.atf_snf.in_file                arg:algo.cstring  reftype:Val      dflt:'""'  comment:"input PCAP file (full reference) . Empty for live NIC capture"
    dmmeta.field  field:command.atf_snf.dir                    arg:algo.cstring  reftype:Val      dflt:'""'   comment:"dir under temp/atf_snf_logs/ to store output files"
    dmmeta.field  field:command.atf_snf.mult_req_per_frame     arg:bool          reftype:Val      dflt:true        comment:"parse mode: true - multiple req/rsp are expected per frame"
    dmmeta.field  field:command.atf_snf.hex_print              arg:bool          reftype:Val      dflt:false       comment:"print hex buffer"
    dmmeta.field  field:command.atf_snf.live_output            arg:bool          reftype:Val      dflt:false       comment:"live output on snf_mon step"
    dmmeta.field  field:command.atf_snf.timestamp_log          arg:bool          reftype:Val      dflt:true        comment:"add time stamp to log files directory"
EOF

# include omenv  ssim file
acr_ed -del    -ctype atf_snf.FOmnode                         -write || true
acr_ed -create -finput -target atf_snf -ssimfile omdb.omnode -write -comment "inherited from ssimfile"
acr_ed -del    -field atf_snf.FDb.zd_omnode                   -write || true
acr_ed -create -field atf_snf.FDb.zd_omnode                   -arg atf_snf.FOmnode -xref -write -comment ""

# dispatch for x2gw 
acr -merge  -write <<EOF
 acr.delete dmmeta.dispatch  dispatch:atf_snf.In 
 acr.delete   dmmeta.dispatch_msg  dispatch_msg:atf_snf.In/x2.Seqmsg        
 acr.delete   dmmeta.dispatch_msg  dispatch_msg:atf_snf.In/x2.UGPubMsg            
 acr.delete   dmmeta.dispatch_msg  dispatch_msg:atf_snf.In/x2.GUAckMsg           
EOF

acr -merge -write <<EOF
  dmmeta.dispatch  dispatch:atf_snf.In  unk:N  read:N  print:N  haslen:N  call:Y  strict:N  dyn:N  kafka:N  comment:""
    dmmeta.dispatch_msg  dispatch_msg:atf_snf.In/x2.Seqmsg                 comment:""
    dmmeta.dispatch_msg  dispatch_msg:atf_snf.In/x2.UGPubMsg               comment:""
    dmmeta.dispatch_msg  dispatch_msg:atf_snf.In/x2.GUAckMsg               comment:""
EOF



amc
amc_vis atf_snf.%   > ~/av_openacr/${trg}_viz.txt

# ai

echo "done!!!!!!!!!!!!"
