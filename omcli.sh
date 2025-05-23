#!/bin/bash
bin/x2node  -node:'dev.x2-18|dev.x2-17|dev.x2-19' -cmd:pwd -q:N -fail_on_error:Y
bin/x2node  -node:'dev.x2-18|dev.x2-17|dev.x2-19' -cmd:pwd  -fail_on_error:Y
# gdb --args bin/x2node -node:'dev.x2-18|dev.x2-17|dev.x2-19' -cmd:hostname -q:N -fail_on_error:Y


echo "---------------------"
omcli -omnode:dev.x2-4.x2-% -start_clean -verbose
echo "---------------------"
omcli -omnode:dev.x2-4.x2-% -status -verbose


exit 0



# omcli -omnode:dev.x2-4.x2-2 -dkr_clean_run -verbose
#export OMENV=dev.x2-4 && atf_ci -citest:smokex2_ib  | hilite atf_ci.smokex2.*
#export OMENV=dev.x2-4 && atf_ci -citest:smokex2 | hilite atf_ci.smokex2.*

x2rel -create -product:x2
x2rel -product:x2 -omnode:dev.x2-4.x2%    -upload
omcli -omnode:dev.x2-4.x2-1 -start_clean

x2rel -product:x2 -omnode:dev.x2-4.x2%    -upload -dev
# x2rel -product:x2 -omnode:dev.x2-4.kafkaui-1  -upload -dev

# omcli -omnode:dev.x2-4.kafkaui-1   -shell

# # for i in 1 2 3 4; do
# #   x2rel -product:x2 -omnode:dev.x2-4.x2-%    -upload -dev;
# # doneomcli -omnode:dev.x2-4.x2-% -start_clean -verbose



omcli -omnode:dev.x2-4.% -start_clean -verbose
omcli -omnode:dev.x2-4.kafkaui-1   -stop
omcli -omnode:dev.x2-4.kafkaui-1   -start_clean

# goto browser url
