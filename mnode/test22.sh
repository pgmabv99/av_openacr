#!/bin/bash

server="192.168.104.5:1558"
omenv=dev.x2-4

omcli $omenv -dkr_clean_run -omplat:x2
x2rel  -create  -product:"x2|x2w" -omenv:$omenv -upload:Y  -create:Y  -cfg:debug
omcli $omenv.x2% -omplat:x2 -start_clean -debug_x2sup 
sleep 2
/opt/kafka/current/bin/kafka-console-consumer.sh \
  --bootstrap-server $server \
  --topic test-topic \
  --group test-consumer-group \
  --from-beginning \
  --property print.timestamp=true
  


omcli dev.x2-4.x2-% -omplat:x2 -collect_logs



/opt/kafka/current/bin/kafka-topics.sh --bootstrap-server 192.168.104.5:1558 --list

 omcli dev.x2-4.x2-1 -omplat:x2 -shell_cmd:"find /mnt/data-* -maxdepth 2 -type f -path "*/dev.x2-4/*""
 omcli dev.x2-4.x2-1 -omplat:x2 -shell_cmd:"find /mnt/data-* -maxdepth 2 -type f -path "*x2-4*""

# x2rel  -create  -product:"x2|x2w" -omenv:dev.x2-4 -upload:Y  -create:Y  
ls -R /mnt/data-*/*x2-4*
ls -R /mnt/data-*/*x2-4.x2cmt*