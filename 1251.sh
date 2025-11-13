#!/bin/bash
set -x
set -e



acr_ed -del  -ctype atf_lat.FMcb         -write || true
acr_ed -del  -ctype atf_lat.FTcp_pair_hist    -write || true
acr_ed -del  -ctype atf_lat.Progress    -write || true

#-------------Progress
acr_ed -create -ctype atf_lat.Progress                                -write -comment " "
acr_ed -create -field  atf_lat.Progress.time                   -arg algo.UnTime              -write -comment "Report time"
# TCP stats
acr_ed -create -field  atf_lat.Progress.frame_count                    -arg i32              -write -comment "number of frames for this pair"
acr_ed -create -field  atf_lat.Progress.tcp_payload_len_tot            -arg u32              -write -comment "total of tcp payload length per pair"
# Kafka stats
acr_ed -create -field  atf_lat.Progress.kafka_count                    -arg u32              -write -comment "kafka req or rsp count"
acr_ed -create -field  atf_lat.Progress.kafka_req_ack_count            -arg u32              -write -comment "kafka req ack count"
acr_ed -create -field  atf_lat.Progress.kafka_len_tot                  -arg u32              -write -comment "total of kafka req/rsp length per pair"

#--------------tcp pair
acr_ed -create -ctype atf_lat.FTcp_pair_hist                          -pooltype Tpool       -write -comment "tcp pair entry"
acr_ed -create -field  atf_lat.FTcp_pair_hist.tcp_pair_hist            -arg algo.Smallstr50   -write -comment "tcp pair string key host:port-host:port"
acr_ed -create -field  atf_lat.FTcp_pair_hist.progress                 -arg atf_lat.Progress  -write -comment "current progress stats"
acr_ed -create -field  atf_lat.FTcp_pair_hist.last_progress            -arg atf_lat.Progress  -write -comment "last progress stats"

# pointers from above
acr_ed -create -field  atf_lat.FDb.zd_tcp_pair_hist                     -cascdel              -write -comment ""
acr_ed -create -field  atf_lat.FDb.ind_tcp_pair_hist                    -cascdel              -write -comment ""

#-------------main CB
acr_ed -create -ctype atf_lat.FMcb                                     -write -comment "Main CB"
acr_ed -create -field  atf_lat.FMcb.step_count                         -arg u32   -write -comment ""
# stats global for the future 
acr_ed -create -field  atf_lat.FMcb.progress                         -arg atf_lat.Progress  -write -comment "current global progress stats"
acr_ed -create -field  atf_lat.FMcb.last_progress                         -arg atf_lat.Progress  -write -comment "last global progress stats"


# include into _db
acr_ed -del    -field  atf_lat.FDb.mcb                                  -write
acr_ed -create -field  atf_lat.FDb.mcb                                  -arg atf_lat.FMcb      -write -comment ""

#----------FDb  steps

#  set parms for atf_lat




amc
amc_vis atf_lat.%   > ~/av_openacr/${trg}_viz.txt

# ai

echo "done!!!!!!!!!!!!"
