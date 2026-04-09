#!/bin/bash

TAG=${1:-awsci1.sv1/sda1}
REGION="us-east-1"

source /home/avorovich/.ssh/awsx2admin.token

awscurl() {
    curl -sS --request POST \
        --user "$AWS_ACCESS_KEY_ID:$AWS_SECRET_ACCESS_KEY" \
        --aws-sigv4 "aws:amz:$REGION:ec2" \
        "https://ec2.$REGION.amazonaws.com/" \
        -H "Content-Type: application/x-www-form-urlencoded" \
        "$@"
}

echo "=== Delete volumes with tag: $TAG ==="

VOLUME_IDS=$(awscurl \
    --data-urlencode "Action=DescribeVolumes" \
    --data-urlencode "Version=2016-11-15" \
    --data-urlencode "Filter.1.Name=tag:Name" \
    --data-urlencode "Filter.1.Value.1=$TAG" | python3 -c '
import sys,json,xmltodict
j=json.loads(json.dumps(xmltodict.parse(sys.stdin.read())))
items=(j.get("DescribeVolumesResponse",{}).get("volumeSet") or {}).get("item",[])
if not isinstance(items,list): items=[items]
for v in items: print(v.get("volumeId",""), v.get("status",""))
' 2>/dev/null)

if [ -z "$VOLUME_IDS" ]; then
    echo "No volumes found."
    exit 0
fi

while IFS= read -r line; do
    [ -z "$line" ] && continue
    VOL_ID=$(echo "$line" | awk '{print $1}')
    STATUS=$(echo "$line" | awk '{print $2}')
    echo "--- $VOL_ID  status:$STATUS ---"

    if [ "$STATUS" = "in-use" ]; then
        echo "  detaching..."
        awscurl \
            --data-urlencode "Action=DetachVolume" \
            --data-urlencode "Version=2016-11-15" \
            --data-urlencode "VolumeId=$VOL_ID" \
            --data-urlencode "Force=true" | grep -o '<status>[^<]*</status>' | head -1 || true

        echo "  waiting for available..."
        for i in $(seq 1 120); do
            STATUS=$(awscurl \
                --data-urlencode "Action=DescribeVolumes" \
                --data-urlencode "Version=2016-11-15" \
                --data-urlencode "VolumeId.1=$VOL_ID" | python3 -c '
import sys,json,xmltodict
j=json.loads(json.dumps(xmltodict.parse(sys.stdin.read())))
item=(j.get("DescribeVolumesResponse",{}).get("volumeSet") or {}).get("item")
print(item.get("status","") if item else "")
' 2>/dev/null)
            printf "  status:%s elapsed:%s\n" "$STATUS" "$i"
            [ "$STATUS" = "available" ] && break
            sleep 1
        done
    fi

    echo "  deleting $VOL_ID..."
    awscurl \
        --data-urlencode "Action=DeleteVolume" \
        --data-urlencode "Version=2016-11-15" \
        --data-urlencode "VolumeId=$VOL_ID" | grep -o '<return>[^<]*</return>' || true
    echo "  done."
done <<< "$VOLUME_IDS"

echo "=== Done ==="
