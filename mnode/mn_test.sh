#!/bin/bash
pkill javaa || true
ps -aux | grep java | grep kafka | grep -v grep || true

set -e
source mn_set.sh
mn_clean.sh
mn_tap.sh  
mn_brokers.sh
if [ "$client" = "x2" ]; then
    mn_x2write_read.sh
elif [ "$client" = "ak" ]; then
    mn_produce.sh
    mn_consume.sh
else
  echo "unknown client:$client - no action"
fi
sleep 2
# loop in above
mn_collect.sh
