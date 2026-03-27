#!/usr/bin/env bash
set -euo pipefail

NAME_TAG="${1:-awsci1.sv1/sdf}"
REGION="us-east-1"

TMP_DIR="${TMP_DIR:-/tmp/awcli}"
mkdir -p "$TMP_DIR"

TAG_FILE="$TMP_DIR/tagging.json"
VALID_FILE="$TMP_DIR/valid_volumes.txt"

> "$VALID_FILE"

echo "[INFO] Looking up volumes with tag Name=$NAME_TAG"

# --- 1. Query Tagging API ---
bash -c $'source /home/avorovich/.ssh/awsx2admin.token && \
curl -sS --request POST \
  --user "$AWS_ACCESS_KEY_ID:$AWS_SECRET_ACCESS_KEY" \
  --aws-sigv4 "aws:amz:'"$REGION"':tagging" \
  "https://tagging.'"$REGION"'.amazonaws.com/" \
  -H "Content-Type: application/json" \
  -H "Accept: application/json" \
  -H "Content-Encoding: amz-1.0" \
  -H "X-Amz-Target: ResourceGroupsTaggingAPI_20170126.GetResources" \
  --data '\''{
    "ResourcesPerPage":100,
    "ResourceTypeFilters":["ec2:volume"],
    "TagFilters":[{"Key":"Name","Values":["'"$NAME_TAG"'"]}]
  }'\'' ' | jq '.' > "$TAG_FILE"

# cat "$TAG_FILE"
# exit 0

# --- 2. Extract volume IDs ---
VOLUME_IDS=$(jq -r '.ResourceTagMappingList[].ResourceARN' "$TAG_FILE" \
  | awk -F/ '{print $NF}')

if [[ -z "$VOLUME_IDS" ]]; then
    echo "[INFO] No tagged volumes found"
    exit 0
fi

echo "[INFO] Found tagged volumes:"
echo "$VOLUME_IDS"

# --- 3. Validate each volume via EC2 ---
for VOL in $VOLUME_IDS; do
    echo "[INFO] Checking volume $VOL"

    RESP=$(bash -c $'source /home/avorovich/.ssh/awsx2admin.token && \
    curl -sS --request POST \
      --user "$AWS_ACCESS_KEY_ID:$AWS_SECRET_ACCESS_KEY" \
      --aws-sigv4 "aws:amz:'"$REGION"':ec2" \
      "https://ec2.'"$REGION"'.amazonaws.com/" \
      -H "Content-Type: application/x-www-form-urlencoded" \
      --data-urlencode "Action=DescribeVolumes" \
      --data-urlencode "Version=2016-11-15" \
      --data-urlencode "VolumeId.1='"$VOL"'" ')

    # Convert XML → JSON
    JSON=$(echo "$RESP" | python3 -c 'import sys, json, xmltodict; print(json.dumps(xmltodict.parse(sys.stdin.read())))')

    # Check for error
    if echo "$JSON" | jq -e '.Response.Errors' >/dev/null 2>&1; then
        echo "[WARN] Stale tag: $VOL does not exist"
    else
        echo "[OK] Valid volume: $VOL"
        echo "$VOL" >> "$VALID_FILE"
    fi
done

# --- 4. Summary ---
echo
echo "==== VALID VOLUMES ===="
cat "$VALID_FILE" || true


exit

#
n=20
for i in $(seq 1 $n); do atf_awcli -test:%ebs%; done