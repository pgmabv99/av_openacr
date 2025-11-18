#!/bin/bash
set -x
set -e

acr_ed -del  -ctype atf_lat.FMcb         -write || true
acr_ed -del  -ctype atf_lat.FTcp_pair_hist    -write || true
acr_ed -del  -ctype atf_lat.Progress    -write || true

acr_ed -del  -ctype omdb.OmTcpPairRec     -write || true
acr_ed -del  -ssimfile:omdb.tcp_pair_hist_rec   -write || true

#-------------Tcp_pair_hist_rec 
acr_ed -create  -ssimfile:omdb.om_tcp_pair_rec   -write -comment "tcp pair history record"
acr_ed -create -field  omdb.OmTcpPairRec.snapshot_id                   -arg u32              -write -comment "snap"
acr_ed -create -field  omdb.OmTcpPairRec.time                          -arg algo.UnTime    -write -comment "Report time"
acr_ed -create -field  omdb.OmTcpPairRec.frame_count                   -arg u32              -write -comment "number of frames for this pair"
acr_ed -create -field  omdb.OmTcpPairRec.kafka_count               -arg u32              -write -comment "number of kafka req  for this pair"
acr_ed -create -field  omdb.OmTcpPairRec.host                          -arg algo.Smallstr50  -write -comment "capture host"
acr_ed -create -field  omdb.OmTcpPairRec.client_id_key                 -arg algo.Smallstr50  -write -comment "kafka client id"

#-------------Progress
acr_ed -create -ctype  atf_lat.Progress                                -write -comment " "
acr_ed -create -field  atf_lat.Progress.time                           -arg algo.UnTime      -write -comment "Report time"
acr_ed -create -field  atf_lat.Progress.frame_count                    -arg u32              -write -comment "number of frames for this pair"
acr_ed -create -field  atf_lat.Progress.kafka_count                -arg u32              -write -comment "number of kafka req  for this pair"
acr_ed -create -field  atf_lat.Progress.host                           -arg algo.Smallstr50  -write -comment "host of the tap"
acr_ed -create -field  atf_lat.Progress.client_id_key                  -arg algo.Smallstr50  -write -comment "kafka client id for the pair"
acr_ed -create -field  atf_lat.Progress.snapshot_id                     -arg u32              -write -comment ""

#--------------tcp pair
acr_ed -create -ctype  atf_lat.FTcp_pair_hist                          -pooltype Tpool       -write -comment "tcp pair entry"
acr_ed -create -field  atf_lat.FTcp_pair_hist.tcp_pair_hist            -arg algo.Smallstr50   -write -comment "tcp pair string key host:port-host:port"
acr_ed -create -field  atf_lat.FTcp_pair_hist.progress                 -arg atf_lat.Progress  -write -comment "current progress stats"
acr_ed -create -field  atf_lat.FTcp_pair_hist.last_progress            -arg atf_lat.Progress  -write -comment "last progress stats"

# pointers from above
acr_ed -create -field  atf_lat.FDb.zd_tcp_pair_hist                     -cascdel              -write -comment ""
acr_ed -create -field  atf_lat.FDb.ind_tcp_pair_hist                    -cascdel              -write -comment ""

#-------------main CB
acr_ed -create -ctype atf_lat.FMcb                                     -write -comment "Main CB"
acr_ed -create -field  atf_lat.FMcb.step_count                         -arg u32   -write -comment "step count for atf_lat"
acr_ed -create -field  atf_lat.FMcb.fd_out_file                        -arg i32               -dflt:-1       -write -comment "" 
# stats global for the future 
acr_ed -create -field  atf_lat.FMcb.progress                         -arg atf_lat.Progress  -write -comment "current global progress stats"
acr_ed -create -field  atf_lat.FMcb.last_progress                         -arg atf_lat.Progress  -write -comment "last global progress stats"


# include into _db
acr_ed -del    -field  atf_lat.FDb.mcb                                  -write
acr_ed -create -field  atf_lat.FDb.mcb                                  -arg atf_lat.FMcb      -write -comment ""

#----------FDb  steps

#  set parms for atf_lat

acr -merge  -write <<EOF
acr.delete dmmeta.field  field:command.atf_lat.out_file
EOF
acr -merge -write <<EOF
    dmmeta.field  field:command.atf_lat.out_file                  arg:algo.cstring         reftype:Val      dflt:'""'         comment:"ssim file to save locally  "
EOF


amc
amc_vis atf_lat.%   > ~/av_openacr/${trg}_viz.txt

# ai

echo "done!!!!!!!!!!!!"
