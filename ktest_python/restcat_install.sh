#!/bin/bash
set -e

# Configuration variables (replace with your MinIO details)
MINIO_ENDPOINT="http://dev.x2-4.minio-1.ext-0:1673"  # e.g., http://localhost:9000
MINIO_ACCESS_KEY="minioadmin"
MINIO_SECRET_KEY="minioadmin"
BUCKET_NAME="iceberg-warehouse"
ICEBERG_VERSION="1.6.0"
REST_PORT="8181"
HOME_DIR="$HOME"
CONFIG_DIR="$HOME_DIR/iceberg-rest-config"
JAR_DIR="$HOME_DIR/iceberg/rest-catalog/build/libs"
CONFIG_FILE="$CONFIG_DIR/iceberg-rest.properties"

# Step 1: Install prerequisites
echo "Installing prerequisites (Java, Git, Gradle)..."
sudo apt update
sudo apt install -y openjdk-11-jdk git unzip

# Install Gradle
if ! command -v gradle &> /dev/null; then
    echo "Installing Gradle..."
    cd "$HOME_DIR"
    wget -q https://services.gradle.org/distributions/gradle-7.6-bin.zip
    unzip -q gradle-7.6-bin.zip
    export PATH="$PATH:$HOME_DIR/gradle-7.6/bin"
    echo 'export PATH="$PATH:$HOME_DIR/gradle-7.6/bin"' >> "$HOME_DIR/.bashrc"
else
    echo "Gradle already installed."
fi

# Verify installations
java -version
git --version
gradle --version

# Step 2: Clone and build Apache Iceberg
echo "Cloning Apache Iceberg repository..."
cd "$HOME_DIR"
if [ ! -d "iceberg" ]; then
    git clone https://github.com/apache/iceberg.git
fi
cd iceberg
git checkout "apache-iceberg-$ICEBERG_VERSION"

echo "Building Iceberg REST catalog..."
./gradlew clean build -x test -x integrationTest

# Verify JAR exists
JAR_FILE="$JAR_DIR/iceberg-rest-catalog-$ICEBERG_VERSION.jar"
if [ ! -f "$JAR_FILE" ]; then
    echo "Error: JAR file not found at $JAR_FILE"
    exit 1
fi

# Step 3: Configure REST catalog
echo "Creating REST catalog configuration..."
mkdir -p "$CONFIG_DIR"
cat << EOF > "$CONFIG_FILE"
catalog.type=rest
catalog.impl=org.apache.iceberg.rest.RESTCatalog
catalog.warehouse=s3://$BUCKET_NAME/
catalog.io-impl=org.apache.iceberg.aws.s3.S3FileIO
catalog.s3.endpoint=$MINIO_ENDPOINT
catalog.s3.path-style-access=true
catalog.s3.access-key-id=$MINIO_ACCESS_KEY
catalog.s3.secret-access-key=$MINIO_SECRET_KEY
aws.region=us-east-1
server.port=$REST_PORT
EOF

# Step 4: Run REST catalog service
echo "Starting Iceberg REST catalog service..."
java -jar "$JAR_FILE" --config "$CONFIG_FILE" &
REST_PID=$!

# Wait a few seconds for the server to start
sleep 5

# Step 5: Verify REST catalog is running
echo "Verifying REST catalog service..."
if curl -s "http://localhost:$REST_PORT/v1/config" | grep -q "defaults"; then
    echo "REST catalog is running successfully on http://localhost:$REST_PORT"
else
    echo "Error: REST catalog failed to start. Check logs for details."
    kill $REST_PID
    exit 1
fi

echo "Setup complete. REST catalog is running in the background (PID: $REST_PID)."
echo "To stop the service, run: kill $REST_PID"
echo "To access the catalog, use URI: http://localhost:$REST_PORT in your Python program."