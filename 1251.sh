#!/bin/bash
set -x
set -e


#-------------OmToppart  
acr_ed -del  -ssimfile:omdb.om_toppart   -write || true
acr_ed -create  -ssimfile:omdb.om_toppart   -write -comment "topic/partition stats records for transfer"
acr_ed -create -field omdb.OmToppart.snapshot_id                   -arg u32              -write -comment "snap"
acr_ed -create -field omdb.OmToppart.time                          -arg algo.UnTime                 -write -comment "Report time"
acr_ed -create -field omdb.OmToppart.offset_produce                -arg i64                         -write  -comment "latest produce offset"
acr_ed -create -field omdb.OmToppart.offset_fetch_fst              -arg i64                         -write  -comment "latest fetch offset.fitst in batch"
acr_ed -create -field omdb.OmToppart.offset_fetch_lst              -arg i64                         -write  -comment "latest fetch offset.last in batch"
acr_ed -create -field omdb.OmToppart.high_watermark                -arg i64                         -write  -comment "high watermark"
acr_ed -create -field omdb.OmToppart.host                          -arg algo.Smallstr50             -write -comment "capture host"
acr_ed -create -field omdb.OmToppart.topic_name                    -arg algo.Smallstr100             -write -comment "topic name"

#-------------OmTcpPair 
acr_ed -del     -ssimfile:omdb.om_tcp_pair  -write || true
acr_ed -create  -ssimfile:omdb.om_tcp_pair   -write -comment "tcp pair  record for transfer latency"
acr_ed -create -field  omdb.OmTcpPair.snapshot_id                   -arg u32              -write -comment "snap"
acr_ed -create -field  omdb.OmTcpPair.time                          -arg algo.UnTime      -write -comment "Report time"
acr_ed -create -field  omdb.OmTcpPair.frame_count                   -arg u32              -write -comment "number of frames for this pair"
acr_ed -create -field  omdb.OmTcpPair.kafka_count                   -arg u32              -write -comment "number of kafka req  for this pair"
acr_ed -create -field  omdb.OmTcpPair.client_id_key                 -arg algo.Smallstr50  -write -comment "kafka client id"
acr_ed -create -field  omdb.OmTcpPair.host                          -arg algo.Smallstr50  -write -comment "capture host"


#--------------FTcp_pair_hist
acr_ed -del    -ctype atf_lat.FTcp_pair_hist    -write || tru
acr_ed -create -ctype  atf_lat.FTcp_pair_hist                          -pooltype Tpool       -write -comment "tcp pair entry"
acr_ed -create -field  atf_lat.FTcp_pair_hist.tcp_pair_hist            -arg algo.Smallstr50   -write -comment "tcp pair string key host:port-host:port"
acr_ed -create -field  atf_lat.FTcp_pair_hist.progress                 -arg omdb.OmTcpPair  -write -comment "current progress stats"
acr_ed -create -field  atf_lat.FTcp_pair_hist.last_progress            -arg omdb.OmTcpPair  -write -comment "last progress stats"

# pointers from above
acr_ed -create -field  atf_lat.FDb.zd_tcp_pair_hist                     -cascdel              -write -comment ""
acr_ed -create -field  atf_lat.FDb.ind_tcp_pair_hist                    -cascdel              -write -comment ""
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

#-------------main CB
acr_ed -del    -ctype atf_lat.FMcb         -write || true
acr_ed -create -ctype atf_lat.FMcb                                     -write -comment "Main CB"
acr_ed -create -field  atf_lat.FMcb.step_count                         -arg u32   -write -comment "step count for atf_lat"
acr_ed -create -field  atf_lat.FMcb.fd_out_file                        -arg i32               -dflt:-1       -write -comment "" 
acr_ed -create -field  atf_lat.FMcb.dashboard_ready                    -arg bool              -dflt:false       -write -comment "" 
acr_ed -create -field  atf_lat.FMcb.remote_time_cur                       -arg algo.UnTime       -dflt:0       -write -comment "remote time from cur  step" 
acr_ed -create -field  atf_lat.FMcb.remote_time_last                   -arg algo.UnTime       -dflt:0       -write -comment "remote time from last step" 


# include into _db
acr_ed -del    -field  atf_lat.FDb.mcb                                  -write
acr_ed -create -field  atf_lat.FDb.mcb                                  -arg atf_lat.FMcb      -write -comment ""

#----------FDb  steps

#  set parms for atf_lat

acr -merge  -write <<EOF
acr.delete dmmeta.field  field:command.atf_lat.out_file
acr.delete dmmeta.field  field:command.atf_lat.skip_old
EOF
acr -merge -write <<EOF
    dmmeta.field  field:command.atf_lat.out_file                  arg:algo.cstring         reftype:Val      dflt:'""'         comment:"ssim file to save locally  "
    dmmeta.field  field:command.atf_lat.skip_old                  arg:bool                 reftype:Val      dflt:false         comment:"skip snapshots before current local one "
EOF


amc
amc_vis atf_lat.%   > ~/av_openacr/${trg}_viz.txt

# ai

echo "done!!!!!!!!!!!!"
