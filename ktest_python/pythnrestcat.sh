#!/bin/bash
set -e

# Configuration variables
MINIO_ENDPOINT="http://dev.x2-4.minio-1.ext-0:1673"
MINIO_ACCESS_KEY="minioadmin"
MINIO_SECRET_KEY="minioadmin"
BUCKET_NAME="iceberg-warehouse"
REST_PORT="1785"
HOME_DIR="$HOME"
CONFIG_DIR="$HOME_DIR/iceberg-open-api-config"
CONFIG_FILE="$CONFIG_DIR/iceberg-open-api.yaml"
LOG_FILE="$HOME_DIR/iceberg_rest_server.log"

# Step 1: Configure REST catalog
echo "Creating REST catalog configuration..."
mkdir -p "$CONFIG_DIR"
cat << EOF > "$CONFIG_FILE"
catalog:
  default:
    type: rest
    uri: http://localhost:$REST_PORT
    s3.endpoint: $MINIO_ENDPOINT
    s3.access-key-id: $MINIO_ACCESS_KEY
    s3.secret-access-key: $MINIO_SECRET_KEY
    s3.path-style-access: true
    warehouse: s3://$BUCKET_NAME/
EOF

# Step 2: Run REST catalog service
echo "Starting PyIceberg REST catalog service..."
python3 -m pyiceberg.catalog.rest --port "$REST_PORT" --config "$CONFIG_FILE" > "$LOG_FILE" 2>&1 &
REST_PID=$!

# Wait a few seconds for the server to start
sleep 5

# Step 3: Verify REST catalog is running
echo "Verifying REST catalog service..."
if curl -s "http://localhost:$REST_PORT/v1/config" | grep -q "defaults"; then
    echo "REST catalog is running successfully on http://localhost:$REST_PORT"
else
    echo "Error: REST catalog failed to start. Checking port conflict..."
    # Check if port is in use
    if netstat -tuln | grep -q ":$REST_PORT"; then
        echo "Port $REST_PORT is in use. Trying alternative port 8080..."
        kill $REST_PID || true
        REST_PORT="8080"
        python3 -m pyiceberg.catalog.rest --port "$REST_PORT" --config "$CONFIG_FILE" > "$LOG_FILE" 2>&1 &
        REST_PID=$!
        sleep 5
        if curl -s "http://localhost:$REST_PORT/v1/config" | grep -q "defaults"; then
            echo "REST catalog is running successfully on http://localhost:$REST_PORT"
        else
            echo "Error: REST catalog still failed to start. Check logs in $LOG_FILE"
            cat "$LOG_FILE"
            kill $REST_PID || true
            exit 1
        fi
    else
        echo "Error: REST catalog failed to start (no port conflict). Check logs in $LOG_FILE"
        cat "$LOG_FILE"
        kill $REST_PID || true
        exit 1
    fi
fi

echo "Setup complete. REST catalog is running in the background (PID: $REST_PID)."
echo "To stop the service, run: kill $REST_PID"
echo "To access the catalog, use URI: http://localhost:$REST_PORT in your Python program."