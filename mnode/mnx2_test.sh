#!/bin/bash
pkill javaa || true
ps -aux | grep java | grep kafka | grep -v grep || true

mn_clean.sh
mn_tap.sh
mn_brokers.sh
mn_x2write_read.sh
mn_collect.sh
exit
