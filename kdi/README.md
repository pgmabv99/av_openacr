## install cargo 

```
curl https://sh.rustup.rs -sSf | sh
```



##  build later rdkafka 2.12  (our homes have 2.3)
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

## remove calls to unused error fnction form source , hugh ??
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
## build kdi

```
$ cargo build --features s3
   Compiling kafka-delta-ingest v0.4.0 (/home/avorovich/kafka-delta-ingest)
    Finished `dev` profile [unoptimized + debuginfo] target(s) in 8.37s
```

## prep kafka

https://github.com/pgmabv99/av_openacr/blob/main/kdi/kdi_prep.sh

## run kdi 

https://github.com/pgmabv99/av_openacr/blob/main/kdi/kdi_start.sh

## misc

mc alias set minio-02 http://nj1-4.minio-1.ext-0:1673 minioadmin minioadmin --api S3v4 --path auto