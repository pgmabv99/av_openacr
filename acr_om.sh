#!/bin/bash
set -x
set -e
#  common fields for atf_snf and atf_lat

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
set -e
acr_ed -del     -ssimfile:omdb.om_tcp_pair  -write || true
acr_ed -create  -ssimfile:omdb.om_tcp_pair   -write -comment "tcp pair  record for transfer latency"
acr_ed -create -field  omdb.OmTcpPair.snapshot_id                   -arg u32              -write -comment "snap"
acr_ed -create -field  omdb.OmTcpPair.time                          -arg algo.UnTime      -write -comment "Report time"
acr_ed -create -field  omdb.OmTcpPair.frame_count                   -arg u32              -write -comment "number of frames for this pair"
acr_ed -create -field  omdb.OmTcpPair.kafka_count                   -arg u32              -write -comment "number of kafka req  for this pair"
acr_ed -create -field  omdb.OmTcpPair.kafka_lat_tot_per_step        -arg u64              -write -comment "sum of  latencies  per step"
acr_ed -create -field  omdb.OmTcpPair.kafka_lat_max_per_step        -arg u64              -write -comment "max of  latencies  per step"
acr_ed -create -field  omdb.OmTcpPair.kafka_lat_min_per_step        -arg u64              -write -comment "min of  latencies  per step"
acr_ed -create -field  omdb.OmTcpPair.kafka_count_per_step          -arg u64              -write -comment "count of kafka req per step"
acr_ed -create -field  omdb.OmTcpPair.kafka_prod_msg_count_per_step  -arg u64              -write -comment "produce msg count per step. across all partitions"
acr_ed -create -field  omdb.OmTcpPair.kafka_fetch_msg_lat_tot_per_step  -arg u64              -write -comment "fetch msg total fetch latency. host_time - max_timestamp"
acr_ed -create -field  omdb.OmTcpPair.kafka_fetch_msg_count_per_step  -arg u64              -write -comment "fetch msg count per step. across all partitions"
acr_ed -create -field  omdb.OmTcpPair.client_id_key                 -arg algo.Smallstr50  -write -comment "kafka client id"
acr_ed -create -field  omdb.OmTcpPair.host                          -arg algo.Smallstr50  -write -comment "capture host"
amc

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

amc

echo "done!!!!!!!!!!!!"
