#!/bin/bash
# Build and run HelloSpark Java program with Spark

set -e

SPARK_HOME=/opt/spark
SRC=HelloSpark.java
MAIN_CLASS=HelloSpark
JAR=HelloSpark.jar

cd /home/avorovich/av_openacr/spark

echo ">>> Compiling $SRC..."
javac -cp "$SPARK_HOME/jars/*" $SRC

echo ">>> Packaging into $JAR..."
jar cf $JAR ${MAIN_CLASS}*.class

echo ">>> Running Spark job..."
$SPARK_HOME/bin/spark-submit \
  --class $MAIN_CLASS \
  --master local[*] \
  $JAR


# $SPARK_HOME/bin/spark-submit \
#   --class HelloSpark \
#   --master local[*] \
#   --conf "spark.driver.extraJavaOptions=-Dlog4j.rootCategory=ERROR,console -Dlog4j.logger.org.apache.spark=ERROR -Dlog4j.logger.org.spark_project=ERROR -Dlog4j.logger.org.apache.hadoop=ERROR" \
#   $JAR