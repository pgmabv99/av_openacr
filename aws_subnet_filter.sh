#!/bin/bash
# list_subnets_by_tag.sh
# Lists subnets with a specific tag and their route tables

TAG_VALUE="awsci1.ctrl"
REGION="us-east-1"

source ~/.ssh/awsx2admin.token

echo "[INFO] Searching subnets with tag Name=$TAG_VALUE..."

# Get subnets via Tagging API
subnets=$(curl -sS --request POST \
  --user "$AWS_ACCESS_KEY_ID:$AWS_SECRET_ACCESS_KEY" \
  --aws-sigv4 "aws:amz:$REGION:tagging" \
  "https://tagging.$REGION.amazonaws.com/" \
  -H "Content-Type: application/json" \
  -H "Accept: application/json" \
  -H "Content-Encoding: amz-1.0" \
  -H "X-Amz-Target: ResourceGroupsTaggingAPI_20170126.GetResources" \
  --data "{\"ResourcesPerPage\":100,\"ResourceTypeFilters\":[\"ec2:subnet\"],\"TagFilters\":[{\"Key\":\"Name\",\"Values\":[\"$TAG_VALUE\"]}]}")

# Extract subnet ARNs and IDs
subnet_arns=$(echo "$subnets" | jq -r '.ResourceTagMappingList[].ResourceARN')
subnet_ids=$(echo "$subnet_arns" | sed -E 's|arn:aws:ec2:[^:]+:[0-9]+:subnet/||')

if [[ -z "$subnet_ids" ]]; then
    echo "[WARN] No subnets found."
    exit 0
fi

echo "[INFO] Found subnets: $subnet_ids"

# Loop over subnets
for subnet in $subnet_ids; do
    echo "--------------------------------------------------"
    echo "Subnet ID: $subnet"

    # Tags
    echo "Tags:"
    echo "$subnets" | jq -r --arg SUBNET "$subnet" '
      .ResourceTagMappingList[]
      | select(.ResourceARN | endswith($SUBNET))
      | .Tags[] | "  \(.Key) = \(.Value)"'

    # Route tables
    echo "Route Tables:"
    rt_json=$(curl -sS --request POST \
      --user "$AWS_ACCESS_KEY_ID:$AWS_SECRET_ACCESS_KEY" \
      --aws-sigv4 "aws:amz:$REGION:ec2" \
      "https://ec2.$REGION.amazonaws.com/" \
      -H "Content-Type: application/x-www-form-urlencoded" \
      --data-urlencode "Action=DescribeRouteTables" \
      --data-urlencode "Version=2016-11-15" \
      --data-urlencode "Filter.1.Name=association.subnet-id" \
      --data-urlencode "Filter.1.Value.1=$subnet" \
      --data-urlencode "MaxResults=100" \
      -s)

    echo "$rt_json" | python3 -c 'import sys, json, xmltodict; print(json.dumps(xmltodict.parse(sys.stdin.read()), indent=2))' | jq '.DescribeRouteTablesResponse.routeTableSet.item | if type=="array" then .[] else . end | {RouteTableId:.routeTableId, Routes:.routeSet.item}'
done