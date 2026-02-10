atf_rdk points

-progress report in ssim file and accumulation
-custom api configuration for producer and consumer
-custom sequence of producer and consumer actions (e.g. start producer, then consumer, then stop producer, etc.)    



  atf_rdk -mode:p 
  atf_rdk -mode:c

  atf_rdk -mode:t -test:r 

  atf_rdk -mode:t -test:s

  ===========

$ atf_rdk -mode:t -test:r
atf_rdk.info  comment:"Logs directory cleaned"  logs_dir:temp/atf_rdk_logs
atf_rdk.info  comment:"Test rebalance"
atf_rdk.info  comment:"Starting worker"  wrk_id:p_0  mode:p
atf_rdk.info  comment:"Worker still running"  wrk_id:p_0  pid:3129763
atf_rdk.info  comment:"Worker   finished"  wrk_id:p_0  pid:3129763
atf_rdk.info  comment:"Starting worker"  wrk_id:c_0  mode:c
atf_rdk.info  sec:1  comment:"Waiting after starting consumer0"
atf_rdk.info  comment:"Starting worker"  wrk_id:c_1  mode:c
atf_rdk.info  sec:3  comment:"Waiting before describe group. Expect partitions to be shared between consumers"
atf_rdk.info  comment:"partition distribution for  2 consumers after rebalance"  consumer0:20  consumer1:10
atf_rdk.info  comment:"Killing worker process -SIGTERM"  wrk_id:c_1  pid:3129791
atf_rdk.info  sec:3  comment:"Waiting before describe group. Expect partitions to be moved to consumer0"
atf_rdk.info  comment:"partition distribution for  2 consumers after rebalance"  consumer0:30  consumer1:0
atf_rdk.info  comment:"Starting worker"  wrk_id:c_2  mode:c
atf_rdk.info  sec:3  comment:"Waiting before describe group. Expect partitions to be shared between consumers"
atf_rdk.info  comment:"partition distribution for  2 consumers after rebalance"  consumer0:20  consumer2:10
atf_rdk.info  comment:"Killing worker process -SIGKILL"  wrk_id:c_2  pid:3130668
atf_rdk.info  sec:8  comment:"Waiting before describe group. Expect partitions to be moved to consumer0"
atf_rdk.info  comment:"partition distribution for  2 consumers after rebalance"  consumer0:30  consumer2:0
atf_rdk.info  comment:"terminating all worker processes"
atf_rdk.info  comment:"Killing worker process -SIGTERM"  wrk_id:c_0  pid:3129780
atf_rdk.info  comment:"Rebalance test passed"

=====================================================

[0 Feb 09 21:05:00] avorovich@nj1.sv5:~/arnd 
$ atf_rdk -mode:t -test:s -n_p:2 -n_c:4  -step_empty_consume_max:5 -max_msgs:10000 
atf_rdk.info  comment:"Logs directory cleaned"  logs_dir:temp/atf_rdk_logs
atf_rdk.info  comment:"Starting worker"  wrk_id:p_0  mode:p
atf_rdk.info  comment:"Starting worker"  wrk_id:p_1  mode:p
atf_rdk.info  comment:"Starting worker"  wrk_id:c_0  mode:c
atf_rdk.info  comment:"Starting worker"  wrk_id:c_1  mode:c
atf_rdk.info  comment:"Starting worker"  wrk_id:c_2  mode:c
atf_rdk.info  comment:"Starting worker"  wrk_id:c_3  mode:c
atf_rdk.aggregated_progress  "elapsed(sec)":0.0152254  p_up:2  c_up:4  p_lst:0,1,  c_lst:0,1,2,3,  p_ack_cnt:0  p_req_cnt:0  c_cnt:0
atf_rdk.aggregated_progress  "elapsed(sec)":1.01529  p_up:0  c_up:4  p_lst:" , ,"  c_lst:0,1,2,3,  p_ack_cnt:200000  p_req_cnt:200000  c_cnt:0
atf_rdk.aggregated_progress  "elapsed(sec)":2.01529  p_up:0  c_up:4  p_lst:" , ,"  c_lst:0,1,2,3,  p_ack_cnt:200000  p_req_cnt:200000  c_cnt:0
atf_rdk.aggregated_progress  "elapsed(sec)":3.0153  p_up:0  c_up:4  p_lst:" , ,"  c_lst:0,1,2,3,  p_ack_cnt:200000  p_req_cnt:200000  c_cnt:0
atf_rdk.aggregated_progress  "elapsed(sec)":4.01531  p_up:0  c_up:4  p_lst:" , ,"  c_lst:0,1,2,3,  p_ack_cnt:200000  p_req_cnt:200000  c_cnt:0
atf_rdk.aggregated_progress  "elapsed(sec)":5.01534  p_up:0  c_up:3  p_lst:" , ,"  c_lst:"0,1,2, ,"  p_ack_cnt:200000  p_req_cnt:200000  c_cnt:26403
atf_rdk.aggregated_progress  "elapsed(sec)":6.01531  p_up:0  c_up:3  p_lst:" , ,"  c_lst:"0,1,2, ,"  p_ack_cnt:200000  p_req_cnt:200000  c_cnt:26575
atf_rdk.aggregated_progress  "elapsed(sec)":7.01533  p_up:0  c_up:3  p_lst:" , ,"  c_lst:"0,1,2, ,"  p_ack_cnt:200000  p_req_cnt:200000  c_cnt:46338
atf_rdk.aggregated_progress  "elapsed(sec)":8.01532  p_up:0  c_up:3  p_lst:" , ,"  c_lst:"0,1,2, ,"  p_ack_cnt:200000  p_req_cnt:200000  c_cnt:80144
atf_rdk.aggregated_progress  "elapsed(sec)":9.01533  p_up:0  c_up:3  p_lst:" , ,"  c_lst:"0,1,2, ,"  p_ack_cnt:200000  p_req_cnt:200000  c_cnt:119630
atf_rdk.aggregated_progress  "elapsed(sec)":10.0154  p_up:0  c_up:3  p_lst:" , ,"  c_lst:"0,1,2, ,"  p_ack_cnt:200000  p_req_cnt:200000  c_cnt:158592
atf_rdk.aggregated_progress  "elapsed(sec)":11.0154  p_up:0  c_up:3  p_lst:" , ,"  c_lst:"0,1,2, ,"  p_ack_cnt:200000  p_req_cnt:200000  c_cnt:192528
atf_rdk.aggregated_progress  "elapsed(sec)":12.0154  p_up:0  c_up:3  p_lst:" , ,"  c_lst:"0,1,2, ,"  p_ack_cnt:200000  p_req_cnt:200000  c_cnt:200000
atf_rdk.aggregated_progress  "elapsed(sec)":13.0154  p_up:0  c_up:3  p_lst:" , ,"  c_lst:"0,1,2, ,"  p_ack_cnt:200000  p_req_cnt:200000  c_cnt:200000
atf_rdk.aggregated_progress  "elapsed(sec)":14.0154  p_up:0  c_up:3  p_lst:" , ,"  c_lst:"0,1,2, ,"  p_ack_cnt:200000  p_req_cnt:200000  c_cnt:200000
atf_rdk.aggregated_progress  "elapsed(sec)":15.0154  p_up:0  c_up:3  p_lst:" , ,"  c_lst:"0,1,2, ,"  p_ack_cnt:200000  p_req_cnt:200000  c_cnt:200000
atf_rdk.aggregated_progress  "elapsed(sec)":16.0155  p_up:0  c_up:2  p_lst:" , ,"  c_lst:" ,1,2, ,"  p_ack_cnt:200000  p_req_cnt:200000  c_cnt:200000
atf_rdk.aggregated_progress  "elapsed(sec)":17.0155  p_up:0  c_up:0  p_lst:" , ,"  c_lst:" , , , ,"  p_ack_cnt:200000  p_req_cnt:200000  c_cnt:200000
atf_rdk.info  comment:"requesting exit from MainLoop "  stop:N  p_up:0  c_up:0
atf_rdk.info  comment:"terminating all worker processes"
atf_rdk.aggregated_summary  broker:localhost:54005  "elapsed(sec)":17.9314  p_ack_cnt:200000  p_req_cnt:200000  c_cnt:200000