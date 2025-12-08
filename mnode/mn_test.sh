#!/bin/bash
mn_clean.sh
mn_tap.sh
mn_brokers.sh
sleep 8
mn_produce.sh
mn_consume.sh
# loop in above
mn_collect.sh
