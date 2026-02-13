# Kafka Delta Ingest (KDI)

Reads kafka messages and writes to delta lake tables demo.   

### install cargo 

```
curl https://sh.rustup.rs -sSf | sh
```



###  build latest rdkafka 2.12  (our homes have 2.3)
```
sudo apt install build-essential cmake -y

git clone https://github.com/confluentinc/librdkafka.git
cd librdkafka
git checkout v2.12.1
./configure
make
sudo make install
sudo ldconfig
```

### remove calls to unused error function from source to fix compile errors , hugh ??
```
diff --git a/src/dead_letters.rs b/src/dead_letters.rs
index 9feb0f5..35ba68b 100644
--- a/src/dead_letters.rs
+++ b/src/dead_letters.rs
@@ -6,7 +6,7 @@ use deltalake_core::parquet::errors::ParquetError;
 use deltalake_core::{DeltaTable, DeltaTableError};
 #[cfg(feature = "s3")]
 use dynamodb_lock::dynamo_lock_options;
-use log::{error, info, warn};
+use log::{info, warn};
 #[cfg(feature = "s3")]
 use maplit::hashmap;
 use rdkafka::message::BorrowedMessage;
diff --git a/src/writer.rs b/src/writer.rs
index 5ba1fab..20d80c5 100644
--- a/src/writer.rs
+++ b/src/writer.rs
@@ -30,7 +30,7 @@ use deltalake_core::{
     protocol::{ColumnCountStat, ColumnValueStat, Stats},
     DeltaTable, DeltaTableError, ObjectStoreError,
 };
-use log::{error, info, warn};
+use log::{info, warn};
 use serde_json::{Number, Value};
 use std::collections::HashMap;
 use std::convert::TryFrom;
```

### build kdi

```
$ cargo build --features s3
   Compiling kafka-delta-ingest v0.4.0 (/home/avorovich/kafka-delta-ingest)
    Finished `dev` profile [unoptimized + debuginfo] target(s) in 8.37s
```
### start kafka server and minio

use omcli

### prep kafka and minio (create topic publish some messages and create bucket and copy a delta log file to minio)

Note: Edit the script to set the correct kafka broker and minio endpoint urls and run it

https://github.com/pgmabv99/av_openacr/blob/main/kdi/kdi_prep.sh

### run kdi 

Note: Edit the script to set the correct kafka broker and minio endpoint urls and run it
uncomment the minio section to test ingest to minio, otherwise it will ingest to a local delta table

https://github.com/pgmabv99/av_openacr/blob/main/kdi/kdi_start.sh



NOTE :to allow rust output redirection of stdout 

```
export RUST_LOG=info
export RUST_LOG_STYLE=never   # disables colored logs which sometimes force TTY output
kdi_start.sh > /home/avorovich/av_openacr/kdi/kdi_start.log 2>&1
```

### sample log

https://github.com/pgmabv99/av_openacr/blob/main/kdi/kdi_start.log

### kdi help

```
Starts a stream that consumes from a Kafka topic and writes to a Delta table

Usage: kafka-delta-ingest ingest [OPTIONS] <topic> <table_location>

Arguments:
  <topic>           The Kafka topic to stream from [env: KAFKA_TOPIC=]
  <table_location>  The Delta table location to write out [env: TABLE_LOCATION=]

Options:
  -k, --kafka <kafka>
          Kafka broker connection string to use [env: KAFKA_BROKERS=] [default: localhost:9092]
  -g, --consumer_group <consumer_group>
          Consumer group to use when subscribing to Kafka topics [env: KAFKA_CONSUMER_GROUP=] [default: kafka_delta_ingest]
  -a, --app_id <app_id>
          App ID to use when writing to Delta [env: APP_ID=] [default: kafka_delta_ingest]
      --seek_offsets <seek_offsets>
          Only useful when offsets are not already stored in the delta table. A JSON string specifying the partition offset map as the starting point for ingestion. This is *seeking* rather than _starting_ offsets. The first ingested message would be (seek_offset + 1). Ex: {"0":123, "1":321} [env: KAFKA_SEEK_OFFSETS=]
  -o, --auto_offset_reset <auto_offset_reset>
          The default offset reset policy, which is either 'earliest' or 'latest'.
          The configuration is applied when offsets are not found in delta table or not specified with 'seek_offsets'. This also overrides the kafka consumer's 'auto.offset.reset' config. [env: KAFKA_AUTO_OFFSET_RESET=] [default: earliest]
  -l, --allowed_latency <allowed_latency>
          The allowed latency (in seconds) from the time a message is consumed to when it should be written to Delta. [env: ALLOWED_LATENCY=] [default: 300]
  -m, --max_messages_per_batch <max_messages_per_batch>
          The maximum number of rows allowed in a parquet batch. This shoulid be the approximate number of bytes described by MIN_BYTES_PER_FILE [env: MAX_MESSAGES_PER_BATCH=] [default: 5000]
  -b, --min_bytes_per_file <min_bytes_per_file>
          The target minimum file size (in bytes) for each Delta file. File size may be smaller than this value if ALLOWED_LATENCY does not allow enough time to accumulate the specified number of bytes. [env: MIN_BYTES_PER_FILE=] [default: 134217728]
  -t, --transform <transform>
          A list of transforms to apply to each Kafka message. Each transform should follow the pattern:
          "PROPERTY: SOURCE". For example:
          
          ... -t 'modified_date: substr(modified,`0`,`10`)' 'kafka_offset: kafka.offset'
          
          Valid values for SOURCE come in two flavors: (1) JMESPath query expressions and (2) well known
          Kafka metadata properties. Both are demonstrated in the example above.
          
          The first SOURCE extracts a substring from the "modified" property of the JSON value, skipping 0
          characters and taking 10. the transform assigns the result to "modified_date" (the PROPERTY).
          You can read about JMESPath syntax in https://jmespath.org/specification.html. In addition to the
          built-in JMESPath functions, Kafka Delta Ingest adds the custom `substr` function.
          
          The second SOURCE represents the well-known Kafka "offset" property. Kafka Delta Ingest supports
          the following well-known Kafka metadata properties:
          
          * kafka.offset
          * kafka.partition
          * kafka.topic
          * kafka.timestamp
           [env: TRANSFORMS=]
      --dlq_table_location <dlq_table_location>
          Optional table to write unprocessable entities to [env: DLQ_TABLE_LOCATION=]
      --dlq_transform <dlq_transform>
          Transforms to apply before writing unprocessable entities to the dlq_location [env: DLQ_TRANSFORMS=]
  -c, --checkpoints
          If set then kafka-delta-ingest will write checkpoints on every 10th commit [env: WRITE_CHECKPOINTS=]
  -K, --kafka_setting <kafka_setting>
          A list of additional settings to include when creating the Kafka consumer.
          
          This can be used to provide TLS configuration as in:
          
          ... -K "security.protocol=SSL" "ssl.certificate.location=kafka.crt" "ssl.key.location=kafka.key"
  -s, --statsd_endpoint <statsd_endpoint>
          Statsd endpoint for sending stats [env: STATSD_ENDPOINT=] [default: localhost:8125]
      --json <json>
          Schema registry endpoint, local path, or empty string [env: JSON_REGISTRY=]
      --avro <avro>
          Schema registry endpoint, local path, or empty string [env: AVRO_REGISTRY=]
      --soe-avro <soe-avro>
          Local path to either a single Avro schema file or a directory containing (only) Avro schematas
  -e, --ends_at_latest_offsets
          [env: ENDS_AT_LATEST_OFFSETS=]
      --decompress_gzip
          Enable gzip decompression for incoming messages [env: DECOMPRESS_GZIP=]
  -h, --help
          Print help
```