#!/usr/bin/env bash
set -euo pipefail

NAME_TAG="${1:-awsci1.sv1/sdf}"
REGION="us-east-1"

TMP_DIR="${TMP_DIR:-/tmp/awcli}"
mkdir -p "$TMP_DIR"

TAG_FILE="$TMP_DIR/tagging_cleanup.json"

# 1️⃣ Query Tagging API for matching volumes
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

# 2️⃣ Extract ARNs
ARNS=($(jq -r '.ResourceTagMappingList[].ResourceARN' "$TAG_FILE"))

if [[ ${#ARNS[@]} -eq 0 ]]; then
    echo "[INFO] No resources found"
    exit 0
fi

echo "[INFO] Found ${#ARNS[@]} resources, removing Name tag individually"

# 3️⃣ Delete Name tag one by one
for ARN in "${ARNS[@]}"; do
    echo "[INFO] Removing Name tag from $ARN"
    bash -c $'source /home/avorovich/.ssh/awsx2admin.token && \
    curl -sS --request POST \
      --user "$AWS_ACCESS_KEY_ID:$AWS_SECRET_ACCESS_KEY" \
      --aws-sigv4 "aws:amz:'"$REGION"':tagging" \
      "https://tagging.'"$REGION"'.amazonaws.com/" \
      -H "Content-Type: application/json" \
      -H "Accept: application/json" \
      -H "Content-Encoding: amz-1.0" \
      -H "X-Amz-Target: ResourceGroupsTaggingAPI_20170126.UntagResources" \
      --data '\''{
        "ResourceARNList": ["'"$ARN"'"],
        "TagKeys": ["Name"]
      }'\'' ' | jq '.'
done

echo "[INFO] Cleanup complete"