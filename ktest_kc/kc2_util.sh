#!/bin/bash


echo "show s3 bucket after sleep 10"
sleep 10
omcli  dev.x2-4.minio-1  -status 
exit


mc ls minio-02/bucket-dev.x2-4.kafkacw-1
# confluent format 
omcli  dev.x2-4.minio-1  -shell_cmd:"mc cat minio-02/bucket-dev.x2-4.kafkacw-1/topics/my-test-topic/partition=0/my-test-topic+0+0000000000.json"   

#aiven format 
omcli  dev.x2-4.minio-1  -shell_cmd:"mc cat minio-02/bucket-dev.x2-4.kafkacw-1/mytesttopic-0000000000-00000000000000000000"  
# decode bas64
omcli dev.x2-4.minio-1 \
  -shell_cmd:"mc cat minio-02/bucket-dev.x2-4.kafkacw-1/mytesttopic-0000000000-00000000000000000000" \
| tail -n +2 \
| grep '^{.*}$' \
| while read -r line; do
    echo "$line" | jq -r '.value' | base64 --decode
    echo
done



echo "get connector status and logs "
omcli dev.x2-4.kafkacw-1 -shell_cmd:"curl -sS http://dev.x2-4.kafkacw-1.ctrl-0:1683/connectors | jq ."
# omcli dev.x2-4.kafkacw-1 -shell_cmd:"curl -sS http://dev.x2-4.kafkacw-1.ctrl-0:1683/connectors/dev.x2-4.kafkacw-1-1  | jq ."
# omcli dev.x2-4.kafkacw-1 -shell_cmd:"curl -sS http://dev.x2-4.kafkacw-1.ctrl-0:1683/connectors/dev.x2-4.kafkacw-1-1/config | jq ."

# omcli dev.x2-4.kafkacw-1 -shell_cmd:"grep Processing /home/kafkausr/kafka/logs/connectDistributed.out"
# omcli dev.x2-4.kafkacw-1 -shell_cmd:"tail -f  /home/kafkausr/kafka/logs/connectDistributed.out"

