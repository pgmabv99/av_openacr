
KAFKA_BROKER = "broker1:9092"
KAFKA_TOPIC = "my_topic"
DELTA_TABLE = "my_target_delta"
CHECKPOINT = "/mnt/checkpoints/minimal_kafka"

from pyspark.sql import SparkSession
import time

# ----------------------------
# Configuration
# ----------------------------
KAFKA_BROKER = "nj1-4.kafka-1.ext-0:1643"
KAFKA_TOPIC = "test-topic"
DELTA_TABLE = "my_target_delta"
CHECKPOINT = "/tmp/checkpoints/minimal_kafka"

# ----------------------------
# Create Spark session
# ----------------------------
spark = SparkSession.builder.appName("KafkaToDelta").getOrCreate()

# ----------------------------
# Read from Kafka
# ----------------------------
df = spark.readStream.format("kafka") \
        .option("kafka.bootstrap.servers", KAFKA_BROKER) \
        .option("subscribe", KAFKA_TOPIC) \
        .option("startingOffsets", "latest") \
        .load()


df.show()

# Stop Spark session
spark.stop()


# # Convert Kafka value to string
# df_str = df.selectExpr("CAST(value AS STRING) as value")

# # ----------------------------
# # Start streaming query
# # ----------------------------
# query = df_str.writeStream.format("delta") \
#             .outputMode("append") \
#             .option("checkpointLocation", CHECKPOINT) \
#             .table(DELTA_TABLE)

# print("Streaming query started...")
