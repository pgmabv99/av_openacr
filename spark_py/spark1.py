from pyspark.sql import SparkSession

# Create Spark session (runs locally)
spark = SparkSession.builder \
    .appName("Spark1Example") \
    .master("local[*]") \
    .getOrCreate()

spark.sparkContext.setLogLevel("ERROR")
# Build DataFrame inline
data = [
    (1, "Alice", 29),
    (2, "Bob", 35),
    (3, "Charlie", 23)
]
columns = ["id", "name", "age"]

df = spark.createDataFrame(data, columns)

# Show the DataFrame
df.show()

# Stop Spark session
spark.stop()
