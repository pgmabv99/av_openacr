#!/bin/bash
set -x
set -e


#-------------OmToppart  
acr_ed -del  -ssimfile:omdb.om_toppart   -write || true
acr_ed -create  -ssimfile:omdb.om_toppart   -write -comment "topic/partition stats records for transfer"
acr_ed -create -field omdb.OmToppart.snapshot_id                   -arg u32              -write -comment "snap"
acr_ed -create -field omdb.OmToppart.type                          -arg u32              -write -comment "=1 fetch   offset, 2= produce offsets"
acr_ed -create -field omdb.OmToppart.time                          -arg algo.UnTime                 -write -comment "Report time"
acr_ed -create -field omdb.OmToppart.offset_produce                -arg i64                         -write  -comment "latest produce offset"
acr_ed -create -field omdb.OmToppart.offset_fetch_fst              -arg i64                         -write  -comment "latest fetch offset.fitst in batch"
acr_ed -create -field omdb.OmToppart.offset_fetch_lst              -arg i64                         -write  -comment "latest fetch offset.last in batch"
acr_ed -create -field omdb.OmToppart.high_watermark                -arg i64                         -write  -comment "high watermark"
acr_ed -create -field omdb.OmToppart.host                          -arg algo.Smallstr50             -write -comment "capture host"
acr_ed -create -field omdb.OmToppart.topic_name                    -arg algo.Smallstr100             -write -comment "topic name"

#-------------OmTopNameId
acr_ed -del  -ssimfile:omdb.om_top_name_id    -write || true
acr_ed -create  -ssimfile:omdb.om_top_name_id    -write -comment "map of topic id to name"
acr_ed -create -field omdb.OmTopNameId.topic_id                      -arg algo.Smallstr100               -write -comment ""
acr_ed -create -field omdb.OmTopNameId.topic                         -arg algo.Smallstr100               -write -comment ""
acr_ed -create -field omdb.OmTopNameId.time                           -arg algo.UnTime                   -write -comment ""
acr_ed -create -field omdb.OmTopNameId.snapshot_id                   -arg u32                           -write -comment "snap"

#-------------OmTcpPair 
acr_ed -del     -ssimfile:omdb.om_tcp_pair  -write || true
acr_ed -create  -ssimfile:omdb.om_tcp_pair   -write -comment "tcp pair  record for transfer latency"
acr_ed -create -field  omdb.OmTcpPair.snapshot_id                   -arg u32              -write -comment "snap"
acr_ed -create -field  omdb.OmTcpPair.time                          -arg algo.UnTime      -write -comment "Report time"
acr_ed -create -field  omdb.OmTcpPair.frame_count                   -arg u32              -write -comment "number of frames for this pair"
acr_ed -create -field  omdb.OmTcpPair.kafka_count                   -arg u32              -write -comment "number of kafka req  for this pair"
acr_ed -create -field  omdb.OmTcpPair.kafka_lat_tot_per_step        -arg u64              -write -comment "sum of  latencies  per step"
acr_ed -create -field  omdb.OmTcpPair.kafka_lat_max_per_step        -arg u64              -write -comment "max of  latencies  per step"
acr_ed -create -field  omdb.OmTcpPair.kafka_lat_min_per_step        -arg u64              -write -comment "min of  latencies  per step"
acr_ed -create -field  omdb.OmTcpPair.kafka_count_per_step          -arg u64              -write -comment "count of kafa req per step"
acr_ed -create -field  omdb.OmTcpPair.kafka_prod_msg_count_per_step  -arg u64              -write -comment "produce msg count per step. across all paritions"
acr_ed -create -field  omdb.OmTcpPair.client_id_key                 -arg algo.Smallstr50  -write -comment "kafka client id"
acr_ed -create -field  omdb.OmTcpPair.host                          -arg algo.Smallstr50  -write -comment "capture host"

#-------------OmTapHost (used for x2metrics for now)
acr_ed -del     -ssimfile:omdb.om_tap_host  -write || true
acr_ed -create  -ssimfile:omdb.om_tap_host   -write -comment "tap host record for x2 metrics"
acr_ed -create -field  omdb.OmTapHost.snapshot_id                   -arg u32              -write -comment "snap"
acr_ed -create -field  omdb.OmTapHost.time                          -arg algo.UnTime      -write -comment "Report time"
acr_ed -create -field  omdb.OmTapHost.host                          -arg algo.Smallstr50  -write -comment "capture host"
acr_ed -create -field  omdb.OmTapHost.tot_lat_req                   -arg u64         -write -comment "latency of req from UGPubMsg to GUAckMsg. sum for the step duration"
acr_ed -create -field  omdb.OmTapHost.max_lat_req                   -arg u64         -write -comment "max latency"
acr_ed -create -field  omdb.OmTapHost.min_lat_req                   -arg u64         -write -comment "min latency"
acr_ed -create -field  omdb.OmTapHost.x2_cnt_req                    -arg u64              -write -comment "count of req per step"
acr_ed -create -field  omdb.OmTapHost.tot_lat_seq                   -arg u64         -write -comment "latency of seq from UGPubMsg to In_Seqmsg. sum for the step duration"
acr_ed -create -field  omdb.OmTapHost.max_lat_seq                   -arg u64         -write -comment "max latency"
acr_ed -create -field  omdb.OmTapHost.min_lat_seq                   -arg u64         -write -comment "min latency"
acr_ed -create -field  omdb.OmTapHost.x2_cnt_seq                    -arg i32              -write -comment "count of seq per step"


#--------------FTcp_pair_hist
acr_ed -del    -ctype atf_lat.FTcp_pair_hist    -write || tru
acr_ed -create -ctype  atf_lat.FTcp_pair_hist                          -pooltype Tpool       -write -comment "tcp pair entry"
acr_ed -create -field  atf_lat.FTcp_pair_hist.tcp_pair_hist            -arg algo.Smallstr50   -write -comment "tcp pair string key host:port-host:port"
acr_ed -create -field  atf_lat.FTcp_pair_hist.lst_nonzero_avg_lat      -arg u64              -write -comment "last non zero avg lat string for debugging"
acr_ed -create -field  atf_lat.FTcp_pair_hist.progress                 -arg omdb.OmTcpPair  -write -comment "current progress stats"
acr_ed -create -field  atf_lat.FTcp_pair_hist.last_progress            -arg omdb.OmTcpPair  -write -comment "last progress stats"

# pointers from above
acr_ed -create -field  atf_lat.FDb.zd_tcp_pair_hist                     -cascdel              -write -comment ""
acr_ed -create -field  atf_lat.FDb.ind_tcp_pair_hist                    -cascdel              -write -comment ""

acr_ed -create -field  atf_lat.FTcp_pair_hist.sortfld                   -arg  algo.cstring    -write -comment "sort field for arbitrary  sorting"
acr_ed -create -field  atf_lat.FDb.bh_sortfld -xref                     -arg  atf_lat.FTcp_pair_hist     -sortfld  atf_lat.FTcp_pair_hist.sortfld     -write -comment "bheap on sort field"   

amc
#--------------FToppart_hist

set -e
acr_ed -del    -ctype atf_lat.FToppart_hist    -write || true
acr_ed -create -ctype  atf_lat.FToppart_hist                         -pooltype Tpool       -write -comment "FToppart history"
acr_ed -create -field  atf_lat.FToppart_hist.toppart_hist             -arg algo.Smallstr50  -write -comment ""
acr_ed -create -field  atf_lat.FToppart_hist.om_toppart                -arg omdb.OmToppart   -write -comment " "

# pointers from above
acr_ed -create -field  atf_lat.FDb.bh_toppart_hist                     -cascdel              -write -comment ""
acr_ed -create -field  atf_lat.FDb.ind_toppart_hist                    -cascdel              -write -comment ""
amc

#--------------FTopNameIdHist
set -e
acr_ed -del    -ctype atf_lat.FTopNameIdHist    -write || true
acr_ed -create -ctype  atf_lat.FTopNameIdHist                         -pooltype Tpool       -write -comment "FToppart history"
acr_ed -create -field  atf_lat.FTopNameIdHist.topic_id                -arg algo.Smallstr100        -write -comment ""
acr_ed -create -field  atf_lat.FTopNameIdHist.topic                   -arg algo.Smallstr100 -write -comment ""
acr_ed -create -field  atf_lat.FTopNameIdHist.time                    -arg algo.UnTime      -write -comment "snap"
acr_ed -create -field  atf_lat.FTopNameIdHist.snapshot_id             -arg u32              -write -comment "snap"
# pointers from above
acr_ed -del    -field  atf_lat.FDb.bh_top_name_id_hist                -write || true
acr_ed -del    -field  atf_lat.FDb.ind_top_name_id_hist               -write || true
acr_ed -create -field  atf_lat.FDb.bh_top_name_id_hist  -xref  -arg  atf_lat.FTopNameIdHist   -hashfld   atf_lat.FTopNameIdHist.topic_id             -cascdel              -write -comment ""
acr_ed -create -field  atf_lat.FDb.ind_top_name_id_hist -xref  -arg  atf_lat.FTopNameIdHist   -sortfld   atf_lat.FTopNameIdHist.topic_id             -cascdel              -write -comment ""
amc

#--------------FTapHostHist
set -e
acr_ed -del    -ctype atf_lat.FTapHostHist    -write || true
acr_ed -create -ctype  atf_lat.FTapHostHist                         -pooltype Tpool       -write -comment "FTap host history"
acr_ed -create -field  atf_lat.FTapHostHist.tap_host                -arg algo.Smallstr50    -write -comment "tap host"
acr_ed -create -field  atf_lat.FTapHostHist.om_tap_host             -arg omdb.OmTapHost    -write -comment "tap host stats"
# pointers from above
acr_ed -del    -field  atf_lat.FDb.bh_tap_host_hist                -write || true
acr_ed -del    -field  atf_lat.FDb.ind_tap_host_hist               -write || true
acr_ed -create -field  atf_lat.FDb.bh_tap_host_hist  -xref  -arg  atf_lat.FTapHostHist   -hashfld   atf_lat.FTapHostHist.tap_host             -cascdel              -write -comment ""
acr_ed -create -field  atf_lat.FDb.ind_tap_host_hist -xref  -arg  atf_lat.FTapHostHist   -sortfld   atf_lat.FTapHostHist.tap_host             -cascdel              -write -comment ""
amc

#-------------main CB
acr_ed -del    -ctype atf_lat.FMcb         -write || true
acr_ed -create -ctype atf_lat.FMcb                                     -write -comment "Main CB"
acr_ed -create -field  atf_lat.FMcb.step_count                         -arg u32   -write -comment "step count for atf_lat"
acr_ed -create -field  atf_lat.FMcb.dashboard_ready                    -arg bool              -dflt:false       -write -comment "" 
acr_ed -create -field  atf_lat.FMcb.remote_time_cur                    -arg algo.UnTime       -dflt:0       -write -comment "remote time from cur  step" 
acr_ed -create -field  atf_lat.FMcb.remote_time_last                   -arg algo.UnTime       -dflt:0       -write -comment "remote time from last step" 
acr_ed -create -field  atf_lat.FMcb.atf_lat_dir                        -arg algo.Smallstr50   -dflt:0       -write -comment "directory for library files and dashboard" 


# include into _db
acr_ed -del    -field  atf_lat.FDb.mcb                                  -write
acr_ed -create -field  atf_lat.FDb.mcb                                  -arg atf_lat.FMcb      -write -comment ""

#----------FDb  steps

#  set parms for atf_lat

acr -merge  -write <<EOF
acr.delete dmmeta.field  field:command.atf_lat.in_file
acr.delete dmmeta.field  field:command.atf_lat.out_file
acr.delete dmmeta.field  field:command.atf_lat.skip_old
acr.delete dmmeta.field  field:command.atf_lat.omenv
acr.delete dmmeta.field  field:command.atf_lat.omplat
EOF
acr -merge -write <<EOF
    dmmeta.field  field:command.atf_lat.in_file                   arg:algo.cstring         reftype:Val      dflt:'""'         comment:"read local saved ssim file instead of remote  "
    dmmeta.field  field:command.atf_lat.out_file                  arg:algo.cstring         reftype:Val      dflt:'"rem_saved.ssim"'         comment:"ssim file to save locally  "
    dmmeta.field  field:command.atf_lat.skip_old                  arg:bool                 reftype:Val      dflt:false        comment:"skip snapshots before current local one "
    dmmeta.field  field:command.atf_lat.omenv                     arg:omdb.Omenv           reftype:Pkey     dflt:'""'         comment:"omcli env with the sniffers"
    dmmeta.field  field:command.atf_lat.omplat                    arg:omdb.Omplat          reftype:Pkey     dflt:'""'         comment:"Overwrites default omenv platform"
EOF


amc
amc_vis atf_lat.%   > ~/av_openacr/${trg}_viz.txt

# ai

echo "done!!!!!!!!!!!!"
