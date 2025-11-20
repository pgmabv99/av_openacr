#!/bin/bash
source mn_set.sh
#
set -e
# omcli dev.x2-4 -omtest:om_benchmark -omplat:ak -omrun_minutes:1
x2rel  -create  -product:"tap" -omenv:dev.x2-4 -upload:Y  -create:Y 

omcli dev.x2-4 -omtest:om_benchmark -omplat:ak -omrun_minutes:1 -omrun_driver:kafka-debug-idempotence -omrun_load:debug-simple

omcli $tap_omnnode -ignore_omnode_use -stop
sleep 4
omcli $tap_omnnode -ignore_omnode_use -collect_logs
rm test/om/dev.x2-4/debug-simple*.*
