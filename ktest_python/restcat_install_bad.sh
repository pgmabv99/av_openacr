#!/bin/bash
set -e

# Configuration variables
MINIO_ENDPOINT="http://dev.x2-4.minio-1.ext-0:1673"
MINIO_ACCESS_KEY="minioadmin"
MINIO_SECRET_KEY="minioadmin"
BUCKET_NAME="iceberg-warehouse"
ICEBERG_VERSION="1.9.1"  # Set to 1.9.1; revert to 1.6.1 if tag not found
REST_PORT="1785"
HOME_DIR="$HOME"
CONFIG_DIR="$HOME_DIR/iceberg-open-api-config"
JAR_DIR="$HOME_DIR/iceberg/open-api/build/libs"
CONFIG_FILE="$CONFIG_DIR/iceberg-open-api.properties"
JAVA_HOME="/usr/lib/jvm/java-21-openjdk-amd64"

# Step 1: Remove all Gradle installations
echo "Removing all Gradle installations..."
sudo apt remove -y --purge gradle || true
sudo apt autoremove -y --purge
sudo rm -rf /usr/local/gradle* /opt/gradle*
sed -i '/gradle.*\/bin/d' ~/.bashrc
sed -i '/gradle.*\/bin/d' ~/.bash_profile
source ~/.bashrc || true
killall -9 java || true  # Stop any Gradle daemons

# Step 2: Uninstall all Java versions
echo "Uninstalling all Java versions..."
sudo apt remove -y --purge 'openjdk*' 'java*' || true
sudo apt autoremove -y --purge
sudo update-alternatives --remove-all java || true
sudo update-alternatives --remove-all javac || true
sudo rm -rf /usr/lib/jvm/*

# Step 3: Clean up previous Iceberg installations, configs, and Gradle cache
echo "Cleaning up previous Iceberg, configs, and Gradle cache..."
rm -rf "$HOME_DIR/iceberg" "$CONFIG_DIR" "$HOME_DIR/.gradle"
sed -i '/JAVA_HOME/d' "$HOME_DIR/.bashrc"

# Step 4: Set working directory
echo "Setting working directory to $HOME_DIR..."
cd "$HOME_DIR" || { echo "Error: Cannot change to $HOME_DIR"; exit 1; }

# Step 5: Install and verify Java 21
echo "Installing OpenJDK 21..."
sudo apt update
sudo apt install -y openjdk-21-jdk
if ! java -version 2>&1 | grep -q "21"; then
    echo "Error: Java 21 not installed correctly"
    exit 1
fi
# Set JAVA_HOME and update PATH
export JAVA_HOME="$JAVA_HOME"
export PATH="$JAVA_HOME/bin:$PATH"
echo "export JAVA_HOME=$JAVA_HOME" >> "$HOME_DIR/.bashrc"
echo "export PATH=\$JAVA_HOME/bin:\$PATH" >> "$HOME_DIR/.bashrc"
java -version

# Step 6: Clone and configure Apache Iceberg
echo "Cloning Apache Iceberg repository..."
git clone https://github.com/apache/iceberg.git "$HOME_DIR/iceberg"
cd "$HOME_DIR/iceberg" || { echo "Error: Cannot change to $HOME_DIR/iceberg"; exit 1; }
echo "Checking out apache-iceberg-$ICEBERG_VERSION..."
git fetch origin
git checkout "apache-iceberg-$ICEBERG_VERSION"

# Verify the checked-out version
CURRENT_TAG=$(git describe --tags)
if [ "$CURRENT_TAG" != "apache-iceberg-$ICEBERG_VERSION" ]; then
    echo "Error: Expected tag apache-iceberg-$ICEBERG_VERSION, but got $CURRENT_TAG"
    echo "Check valid tags at https://github.com/apache/iceberg/tags and update ICEBERG_VERSION"
    exit 1
fi

# Ensure gradlew is executable
echo "Ensuring gradlew is executable..."
chmod +x "$HOME_DIR/iceberg/gradlew"

# Build Iceberg REST catalog fat JAR using the Gradle wrapper
echo "Building Iceberg REST catalog with refreshed dependencies..."
./gradlew :iceberg-open-api:shadowJar -x test -x integrationTest --refresh-dependencies --stacktrace --debug --info > "$HOME_DIR/gradle_build.log" 2>&1

# Step 7: Find the REST server JAR
echo "Searching for REST server JAR in $JAR_DIR..."
JAR_FILE=$(find "$JAR_DIR" -name "open-api*.jar" | head -n 1)
if [ -z "$JAR_FILE" ]; then
    echo "Error: No REST server JAR found in $JAR_DIR"
    echo "Attempting to rebuild rest module..."
    ./gradlew :iceberg-open-api:shadowJar -x test -x integrationTest --refresh-dependencies --stacktrace --debug --info > "$HOME_DIR/gradle_rebuild.log" 2>&1
    JAR_FILE=$(find "$JAR_DIR" -name "iceberg-open-api*.jar" | head -n 1)
    if [ -z "$JAR_FILE" ]; then
        echo "Error: Still no JAR found after rebuild. Check build logs in ~/gradle_build.log and ~/iceberg/iceberg-open-api/build/reports/"
        exit 1
    fi
fi
echo "Found JAR: $JAR_FILE"

# Step 8: Configure REST catalog
echo "Creating REST catalog configuration..."
mkdir -p "$CONFIG_DIR"
cat << EOF > "$CONFIG_FILE"
catalog.impl=org.apache.iceberg.hadoop.HadoopCatalog
catalog.warehouse=s3://$BUCKET_NAME/
catalog.io-impl=org.apache.iceberg.aws.s3.S3FileIO
catalog.s3.endpoint=$MINIO_ENDPOINT
catalog.s3.path-style-access=true
catalog.s3.access-key-id=$MINIO_ACCESS_KEY
catalog.s3.secret-access-key=$MINIO_SECRET_KEY
aws.region=us-east-1
server.port=$REST_PORT
EOF

# Step 9: Run REST catalog service
echo "Starting Iceberg REST catalog service..."
java -jar "$JAR_FILE" --config "$CONFIG_FILE" &
REST_PID=$!

# Wait a few seconds for the server to start
sleep 5

# Step 10: Verify REST catalog is running
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