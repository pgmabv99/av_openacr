#!/bin/bash
omplat=${1:?Error: omplat parameter required}
set -e
mn_clean.sh
logname=/home/avorovich/av_openacr/mnode_logs/om_benchmark_$omplat.log
# echo "run om_benchmark - omplat:$omplat  log:$logname"
omcli nj1-4.x2w-% -omplat:x2 -dkr_clean_run
omcli nj1-4.x2ui-%  -omplat:x2 -dkr_clean_run
x2rel -create -product:"x2w|x2ui" -omenv:nj1-4 -upload:Y -create:Y    
omcli nj1-4 -omtest:om_benchmark -omrun_load:max-rate-80-topics-1-partition-100b -omplat:$omplat -omrun_minutes:1 -start_tap -v > $logname 2>&1 
# omcli nj1-4 -omtest:om_benchmark -omplat:$omplat -omrun_minutes:1 -start_tap > $logname 2>&1 

# omcli nj1-4 -omtest:om_benchmark -omplat:$omplat -omrun_minutes:3 -omrun_driver:kafka-debug-idempotence -omrun_load:debug-simple  -start_tap 
# omcli nj1-4 -omtest:om_benchmark -omplat:$omplat -omrun_minutes:3 -omrun_driver:kafka-exactly-once  -omrun_load:simple-workload -start_tap 

mn_collect.sh

grep "option start_clean" $logname
grep "Pub Latency" $logname