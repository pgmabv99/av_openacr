#!/bin/bash

omenv=dev.x2-4
omcli $omenv.x2% -omplat:x2 -dkr_clean_run
x2rel  -create  -product:"x2|x2w" -omenv:$omenv -upload:Y  -create:Y  
omcli $omenv.x2-% -omplat:x2 -start_clean -debug_x2sup    -trace_x2sup:"kafka2.%,x2net.%,timestamps"
omcli $omenv.x2-% -omplat:x2 -collect_logs
