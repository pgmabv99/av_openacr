#!/bin/bash
omcli dev.x2-4 -dkr_clean_run -omplat:x2
# x2rel  -create  -product:"x2|x2w" -omenv:dev.x2-4 -upload:Y  -create:Y  -cfg:debug
x2rel  -create  -product:"x2|x2w" -omenv:dev.x2-4 -upload:Y  -create:Y  

omcli dev.x2-4.x2-% -omplat:x2 -start_clean
omcli dev.x2-4.x2-% -omplat:x2 -collect_logs
 /opt/kafka/current/bin/kafka-topics.sh --bootstrap-server 192.168.104.5:1558 --list


 omcli dev.x2-4.x2-% -omplat:x2 -shell_cmd:"ls -ltr /mnt/data-1/dev.x2-4/*"
 omcli dev.x2-4.x2-% -omplat:x2 -shell_cmd:"ls -ltr /mnt/data-2/dev.x2-4/*"