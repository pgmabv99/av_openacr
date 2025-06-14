#!/bin/bash
bin/x2node  -node:'dev.x2-18|dev.x2-17|dev.x2-19' -cmd:pwd -q:N -fail_on_error:Y
bin/x2node  -node:'dev.x2-18|dev.x2-17|dev.x2-19' -cmd:pwd  -fail_on_error:Y
bin/x2node  -node:'dev.rdpui-5' -cmd:pwd  -fail_on_error:Y
# gdb --args bin/x2node -node:'dev.x2-18|dev.x2-17|dev.x2-19' -cmd:hostname -q:N -fail_on_error:Y


echo "---------------------"
omcli -omnode:dev.x2-4.x2-% -start_clean -verbose
echo "---------------------"
omcli -omnode:dev.x2-4.x2-% -status -verbose


exit 0



# omcli -omnode:dev.x2-4.x2-2 -dkr_clean_run -verbose
#export OMENV=dev.x2-4 && atf_ci -citest:smokex2_ib  | hilite atf_ci.smokex2.*
#export OMENV=dev.x2-4 && atf_ci -citest:smokex2 | hilite atf_ci.smokex2.*

# prod deployment on all nodes :source from x2-17
down
ai
omcli -omnode:dev.x2-4.x2% -stop
x2rel -create  -product:x2
x2rel  -upload -product:x2 -omnode:dev.x2-4.x2%
omcli -omnode:dev.x2-4.x2% -start_clean
omcli -omnode:dev.x2-4.x2% -status

# sudo lsof -nP -iTCP -sTCP:LISTEN | grep x2gw

# x2rel -product:x2 -omnode:dev.x2-4.x2%    -upload -dev
# x2rel -product:x2 -omnode:dev.x2-4.kafkaui-1  -upload -dev

#          ===========
omcli -omnode:dev.x2-4.x2-0 -start_clean

omcli -omnode:dev.x2-4.kafkaui-1   -dkr_clean_run
omcli -omnode:dev.x2-4.rdpui-1     -dkr_clean_run

#          ===============
omcli -omnode:dev.x2-4.rdpui-1  -stop
bin/x2node  -node:dev.rdpui-5 -cmd:'./rdpui_only start_clean'  -fail_on_error:Y
bin/x2node  -node:dev.rdpui-5 -shell

#          ===============
omcli -omnode:dev.x2-4.kabin/x2node  -node:dev.kafkaui-5 -cmd:'./kafkaui_only start_clean'  -fail_on_error:Yfkaui-1  -stop

omcli -omnode:dev.x2-4.kafkaui-1  -status



omcli -omnode:dev.ak-8.% -stop
omcli -omnode:dev.ak-8.% -start
# omcli -omnode:dev.ak-8.kafka-% -start
omcli -omnode:dev.ak-8.kafka-% -start_clean
omcli -omnode:dev.ak-8.kafka-% -status



# # for i in 1 2 3 4; do
# #   x2rel -product:x2 -omnode:dev.x2-4.x2-%    -upload -dev;
# # doneomcli -omnode:dev.x2-4.x2-% -start_clean -verbose




# goto browser url
