from pyspark.sql import SparkSession

KAFKA_BROKER = "nj1-4.kafka-1.ext-0:1643"
KAFKA_TOPIC = "test-topic"

spark = SparkSession.builder \
    .appName("KafkaConsole") \
     .master("local[*]") \
    .getOrCreate()

spark.sparkContext.setLogLevel("ERROR")
print(f"Spark session created. Reading from Kafka topic: {KAFKA_TOPIC}")
df = spark.readStream.format("kafka") \
        .option("kafka.bootstrap.servers", KAFKA_BROKER) \
        .option("subscribe", KAFKA_TOPIC) \
        .option("startingOffsets", "earliest") \
        .load()
print("Kafka DataFrame schema:")
df.printSchema()

messages = df.selectExpr("CAST(value AS STRING)")

print("Starting streaming query to console...")
query = messages.writeStream \
    .format("console") \
    .outputMode("append") \
    .option("truncate", "false") \
    .start()

# query.awaitTermination()
query.awaitTermination(timeout=10)

# print("Streaming started. Press Ctrl+C to stop.")

# try:
#     query.awaitTermination()
# except KeyboardInterrupt:
#     print("\nKeyboardInterrupt received → stopping query...")
#     query.stop()
# except Exception as e:
#     print(f"Error in streaming: {e}")
#     query.stop()
# finally:
#     print("Done. Cleaning up Spark session...")
#     spark.stop()
