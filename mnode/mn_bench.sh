#!/bin/bash
source mn_set.sh

set -e
mn_clean.sh
logname=/home/avorovich/av_openacr/mnode_logs/om_benchmark_$omplat.log
echo "run om_benchmark - omplat:$omplat  log:$logname"
# omcli nj1-4 -omtest:om_benchmark -omplat:$omplat -omrun_minutes:1 > $logname 2>&1 
# omcli nj1-4 -omtest:om_benchmark -omplat:$omplat -omrun_minutes:3 -omrun_driver:kafka-debug-idempotence -omrun_load:debug-simple  
# omcli nj1-4 -omtest:om_benchmark -omplat:$omplat -omrun_minutes:3 -omrun_driver:kafka-exactly-once  -omrun_load:simple-workload

mn_collect.sh

grep "option start_clean" $logname
grep "Pub Latency" $logname