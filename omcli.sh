# omcli -omnode:dev.x2-4.x2-1 -dkr_clean_run -verbose

# x2rel -create -product:x2
# x2rel -product:x2 -omnode:dev.x2-4.x2-1    -upload -dev
# x2rel -product:x2 -omnode:dev.x2-4.kafkaui-1  -upload -dev

# omcli -omnode:dev.x2-4.kafkaui-1   -shell

# # for i in 1 2 3 4; do
# #   x2rel -product:x2 -omnode:dev.x2-4.x2-%    -upload -dev;
# # done



omcli -omnode:dev.x2-4.x2-1 -start_clean
omcli -omnode:dev.x2-4.kafkaui-1   -start_clean

omcli -omnode:dev.x2-4.%  -status
omcli -omnode:dev.x2-4.kafkaui-1   -status

omcli -omnode:dev.x2-4.%  -stop
omcli -omnode:dev.x2-4.x2-1 -stop
omcli -omnode:dev.x2-4.kafkaui-1   -stop

# goto browser url

