#!/bin/bash
source mn_set.sh

set -e
# # omcli dev.x2-4 -omtest:om_benchmark -omplat:ak -omrun_minutes:1
# x2rel  -create  -product:"tap" -omenv:dev.x2-4 -upload:Y  -create:Y 
mn_clean.sh
omcli dev.x2-4 -omtest:om_benchmark -omplat:$omplat -omrun_minutes:3 -omrun_driver:kafka-debug-idempotence -omrun_load:debug-simple  
# omcli dev.x2-4 -omtest:om_benchmark -omplat:$omplat -omrun_minutes:3 -omrun_driver:kafka-exactly-once  -omrun_load:simple-workload

mn_collect.sh
rm test/om/dev.x2-4/debug-simple*.*
