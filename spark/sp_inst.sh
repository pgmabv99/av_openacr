#!/bin/bash
set -e

# -------------------------------
# Spark + Kafka + Iceberg Installer
# Fully Working Version
# -------------------------------

# Versions
SPARK_VERSION="3.5.6"
HADOOP_VERSION="3"
KAFKA_CONNECTOR_VERSION="3.5.6"
KAFKA_CLIENTS_VERSION="2.8.1"      # Compatible version
ICEBERG_VERSION="1.5.0"
SPARK_HOME="/opt/spark"

# -------------------------------
# Clean temp directory
# -------------------------------
if [ -d "$HOME/tmp" ]; then
    echo "Cleaning ~/tmp directory..."
    rm -rf ~/tmp/*
else
    mkdir -p ~/tmp
fi

# Remove existing Spark install if present
if [ -d "${SPARK_HOME}" ]; then
    echo "Removing existing Spark installation at ${SPARK_HOME}..."
    sudo rm -rf ${SPARK_HOME}
fi

# Recreate SPARK_HOME
sudo mkdir -p ${SPARK_HOME}

# -------------------------------
# Install aria2 if missing
# -------------------------------
if ! command -v aria2c &>/dev/null; then
    echo "Installing aria2..."
    sudo apt update && sudo apt install -y aria2
fi

# -------------------------------
# Mirrors
# -------------------------------
SPARK_MIRROR="https://downloads.apache.org/spark/spark-${SPARK_VERSION}"
MAVEN_MIRROR="https://repo1.maven.org/maven2"

# -------------------------------
# Download Spark
# -------------------------------
echo "Downloading Spark..."
aria2c -x 16 -s 16 -d ~/tmp -o spark.tgz \
    ${SPARK_MIRROR}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz

# Extract Spark to /opt/spark
sudo tar -xzf ~/tmp/spark.tgz -C /opt
sudo mv /opt/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}/* ${SPARK_HOME}
sudo rm -rf /opt/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}

# -------------------------------
# Download Kafka Connector JARs
# -------------------------------
echo "Downloading Kafka connector JARs..."

aria2c -x 16 -s 16 -d ~/tmp -o spark-sql-kafka-0-10_2.12-${KAFKA_CONNECTOR_VERSION}.jar \
    ${MAVEN_MIRROR}/org/apache/spark/spark-sql-kafka-0-10_2.12/${KAFKA_CONNECTOR_VERSION}/spark-sql-kafka-0-10_2.12-${KAFKA_CONNECTOR_VERSION}.jar

aria2c -x 16 -s 16 -d ~/tmp -o spark-token-provider-kafka-0-10_2.12-${KAFKA_CONNECTOR_VERSION}.jar \
    ${MAVEN_MIRROR}/org/apache/spark/spark-token-provider-kafka-0-10_2.12/${KAFKA_CONNECTOR_VERSION}/spark-token-provider-kafka-0-10_2.12-${KAFKA_CONNECTOR_VERSION}.jar

aria2c -x 16 -s 16 -d ~/tmp -o kafka-clients-${KAFKA_CLIENTS_VERSION}.jar \
    ${MAVEN_MIRROR}/org/apache/kafka/kafka-clients/${KAFKA_CLIENTS_VERSION}/kafka-clients-${KAFKA_CLIENTS_VERSION}.jar

# Move Kafka JARs to Spark
sudo mv ~/tmp/spark-sql-kafka-0-10_2.12-${KAFKA_CONNECTOR_VERSION}.jar ${SPARK_HOME}/jars/
sudo mv ~/tmp/spark-token-provider-kafka-0-10_2.12-${KAFKA_CONNECTOR_VERSION}.jar ${SPARK_HOME}/jars/
sudo mv ~/tmp/kafka-clients-${KAFKA_CLIENTS_VERSION}.jar ${SPARK_HOME}/jars/

# -------------------------------
# Download Iceberg Spark Runtime
# -------------------------------
echo "Downloading Iceberg runtime..."
aria2c -x 16 -s 16 -d ~/tmp -o iceberg-spark-runtime-3.4_2.12-${ICEBERG_VERSION}.jar \
    ${MAVEN_MIRROR}/org/apache/iceberg/iceberg-spark-runtime-3.4_2.12/${ICEBERG_VERSION}/iceberg-spark-runtime-3.4_2.12-${ICEBERG_VERSION}.jar

# Move Iceberg JAR to Spark
sudo mv ~/tmp/iceberg-spark-runtime-3.4_2.12-${ICEBERG_VERSION}.jar ${SPARK_HOME}/jars/

# -------------------------------
# Download Iceberg AWS Bundle
# -------------------------------
echo "Downloading Iceberg AWS bundle..."
aria2c -x 16 -s 16 -d ~/tmp -o iceberg-aws-bundle-${ICEBERG_VERSION}.jar \
    ${MAVEN_MIRROR}/org/apache/iceberg/iceberg-aws-bundle/${ICEBERG_VERSION}/iceberg-aws-bundle-${ICEBERG_VERSION}.jar

# Move AWS JAR to Spark
sudo mv ~/tmp/iceberg-aws-bundle-${ICEBERG_VERSION}.jar ${SPARK_HOME}/jars/

# -------------------------------
# Permissions & PATH
# -------------------------------
sudo chown -R $(whoami):$(whoami) ${SPARK_HOME}

if ! grep -q "SPARK_HOME" ~/.bashrc; then
    echo "export SPARK_HOME=${SPARK_HOME}" >> ~/.bashrc
    echo 'export PATH=$SPARK_HOME/bin:$PATH' >> ~/.bashrc
fi

echo "✅ Spark ${SPARK_VERSION} with Kafka and Iceberg installed at ${SPARK_HOME}"
echo "✅ Kafka clients version used: ${KAFKA_CLIENTS_VERSION}"
