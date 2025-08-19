# 1st step "Populate Kafka Cluster with the data"
# it runs for 6 minutes...
omcli  dev.x2-4 -omtest:om_benchmark -omplat:ak

# 2nd step "Run s3sink with different params
# can be repeated multiple times
# expected outcome is a tail -f of kafka/logs/*.out
omcli  dev.x2-4 -omtest:s3sink_manual -omplat:ak

# just starting/stopping the sink

omcli  dev.x2-4.kafkacw-1  -start -omplat:ak
omcli  dev.x2-4.kafkacw-1  -status -omplat:ak
# expected output is the set of params
omcli  dev.x2-4.kafkacw-1  -start -omplat:ak -omrun_connect:aiven-s3sink.gzip -omrun_worker:kafka-connect.dflt 

# logs location kafka/logs/* on dev.x2-4.kafkacw-1
# plugins location is kafka/plugins on dev.x2-4.kafkacw-1

# minio status
omcli  dev.x2-4.minio-1 -status 
# for details and minio manipulations go to dev.x2-4.minio-1

# a lot of connect activity is visible in GUI
# for connector installation details see bin/install-kafka-connectors


