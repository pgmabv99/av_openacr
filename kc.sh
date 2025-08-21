omcli  dev.x2-4.%  -dkr_clean_run -omplat:ak

# 1st step "Populate Kafka Cluster with the data"
# it runs for 6 minutes...
omcli  dev.x2-4 -omtest:om_benchmark -omplat:ak

# 2nd step "Run s3sink with different params
# can be repeated multiple times
# expected outcome is a tail -f of kafka/logs/*.out
# omcli  dev.x2-4 -omtest:s3sink_manual -omplat:ak
omcli  dev.x2-4 -omtest:s3sink_manual -omplat:ak  -omrun_connect:confluent-s3sink.dflt -omrun_worker:kafka-connect.dflt 



