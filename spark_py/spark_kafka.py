from pyspark.sql import SparkSession
import sys
import argparse

parser = argparse.ArgumentParser(description="Kafka to Delta streaming")
parser.add_argument("--broker", default="nj1-4.kafka-1.ext-0:1643", help="Kafka broker address")
args = parser.parse_args()

KAFKA_BROKER = args.broker
KAFKA_TOPIC = "test-topic"
CHECKPOINT_PATH = "./checkpoints/test_topic_delta"
DELTA_PATH = "test_topic_delta"
print(f"==Kafka broker: {KAFKA_BROKER} | Kafka topic: {KAFKA_TOPIC} | Checkpoint path: {CHECKPOINT_PATH} | Delta path: {DELTA_PATH}")

print("==Creating Spark session...")
spark = SparkSession.builder \
    .appName("KafkaConsole") \
    .config("spark.sql.extensions", "io.delta.sql.DeltaSparkSessionExtension") \
    .config("spark.sql.catalog.spark_catalog", "org.apache.spark.sql.delta.catalog.DeltaCatalog") \
    .getOrCreate()

spark.sparkContext.setLogLevel("ERROR")
print(f"==Spark version created: {spark.version}")   
print(f"==Reading from Kafka topic: {KAFKA_TOPIC}")
df = spark.readStream.format("kafka") \
        .option("kafka.bootstrap.servers", KAFKA_BROKER) \
        .option("subscribe", KAFKA_TOPIC) \
        .option("startingOffsets", "earliest") \
        .load()
print("==Kafka DataFrame schema:")
df.printSchema()

df_cast = df.selectExpr("CAST(value AS STRING)")

mode="terminal"
mode="disk"
# mode="catalog"
if mode == "terminal":
    print("==Starting streaming query to console...")
    df_stream = df_cast.writeStream \
        .format("console") \
        .outputMode("append") \
        .option("truncate", "false") \
        .start()
elif mode == "disk":
    print("==Starting streaming query to Delta table...")
    df_stream = df_cast.writeStream.format("delta") \
                .outputMode("append") \
                .option("checkpointLocation", CHECKPOINT_PATH) \
                .start(DELTA_PATH)  # <-- use .start(path) for file-based Delta table

    print(f"==Streaming query started. Writing to Delta table: {DELTA_PATH}")
elif mode == "catalog":
    # One-time setup (run once before streaming)
    print("==Creating Delta table in catalog (if not exists)...")
    spark.sql(f"""
        CREATE TABLE IF NOT EXISTS {DELTA_PATH} (value STRING)
        USING DELTA
        LOCATION '{DELTA_PATH}'  -- optional if managed
    """)
    print("==Starting streaming query to Delta table using catalog...")
    df_stream = df_cast.writeStream.format("delta") \
                .outputMode("append") \
                .option("checkpointLocation", CHECKPOINT_PATH) \
                .toTable("default.test_topic_delta")  # <-- use .toTable(tableName) for catalog-based Delta table

    print("==Streaming query started. Writing to Delta table using catalog: default.test_topic_delta")
else:
    print(f"==Unknown mode: {mode}. No streaming query started.")

print("==Streaming started. Press Ctrl+C to stop.Long traceback will be printed on Ctrl+C, but query should stop gracefully.")
df_stream.awaitTermination()

# todo 
# df_stream.awaitTermination(timeout=10)


# try:
#     df_stream.awaitTermination()
# except KeyboardInterrupt:
#     print("\nKeyboardInterrupt received → stopping query...")
#     df_stream.stop()
# except Exception as e:
#     print(f"Error in streaming: {e}")
#     df_stream.stop()
# finally:
#     print("Done. Cleaning up Spark session...")
#     spark.stop()
