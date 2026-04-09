#!/bin/bash

PREFIX=${1:-awsci1}
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

echo "=== Cleanup network for prefix: $PREFIX ==="

# --- Route tables: disassociate subnet associations then delete custom tables ---
echo "--- route tables ---"
RTBS=$(awscurl \
    --data-urlencode "Action=DescribeRouteTables" \
    --data-urlencode "Version=2016-11-15" | PREFIX="$PREFIX" python3 -c '
import sys,json,xmltodict
j=json.loads(json.dumps(xmltodict.parse(sys.stdin.read())))
items=(j.get("DescribeRouteTablesResponse",{}).get("routeTableSet") or {}).get("item",[])
if not isinstance(items,list): items=[items]
import os; prefix=os.environ.get("PREFIX","")
for r in items:
    tags=(r.get("tagSet") or {}).get("item",[])
    if not isinstance(tags,list): tags=[tags]
    name=next((t["value"] for t in tags if t.get("key")=="Name"),"")
    if not name.startswith(prefix): continue
    assoc=(r.get("associationSet") or {}).get("item",[])
    if not isinstance(assoc,list): assoc=[assoc]
    main=any(a.get("main")=="true" for a in assoc)
    if main: continue
    assoc_ids=" ".join(a.get("routeTableAssociationId","") for a in assoc if a.get("routeTableAssociationId") and a.get("main")!="true")
    print(r.get("routeTableId",""), assoc_ids)
')

while IFS= read -r line; do
    [ -z "$line" ] && continue
    RTB_ID=$(echo "$line" | awk '{print $1}')
    for ASSOC_ID in $(echo "$line" | cut -d' ' -f2-); do
        [ -z "$ASSOC_ID" ] && continue
        echo "  disassociating $ASSOC_ID from $RTB_ID"
        awscurl --data-urlencode "Action=DisassociateRouteTable" \
                --data-urlencode "Version=2016-11-15" \
                --data-urlencode "AssociationId=$ASSOC_ID" | grep -o '<return>[^<]*</return>' || true
    done
    echo "  deleting route table $RTB_ID"
    awscurl --data-urlencode "Action=DeleteRouteTable" \
            --data-urlencode "Version=2016-11-15" \
            --data-urlencode "RouteTableId=$RTB_ID" | grep -o '<return>[^<]*</return>' || true
done <<< "$RTBS"

# --- Subnets ---
echo "--- subnets ---"
SUBNETS=$(awscurl \
    --data-urlencode "Action=DescribeSubnets" \
    --data-urlencode "Version=2016-11-15" | PREFIX="$PREFIX" python3 -c '
import sys,json,xmltodict,os
j=json.loads(json.dumps(xmltodict.parse(sys.stdin.read())))
items=(j.get("DescribeSubnetsResponse",{}).get("subnetSet") or {}).get("item",[])
if not isinstance(items,list): items=[items]
prefix=os.environ.get("PREFIX","")
for s in items:
    tags=(s.get("tagSet") or {}).get("item",[])
    if not isinstance(tags,list): tags=[tags]
    name=next((t["value"] for t in tags if t.get("key")=="Name"),"")
    if name.startswith(prefix): print(s.get("subnetId",""), name)
')

while IFS= read -r line; do
    [ -z "$line" ] && continue
    SUBNET_ID=$(echo "$line" | awk '{print $1}')
    NAME=$(echo "$line" | awk '{print $2}')
    echo "  deleting subnet $SUBNET_ID ($NAME)"
    awscurl --data-urlencode "Action=DeleteSubnet" \
            --data-urlencode "Version=2016-11-15" \
            --data-urlencode "SubnetId=$SUBNET_ID" | grep -o '<return>[^<]*</return>' || true
done <<< "$SUBNETS"

# --- Security groups (non-default, matching prefix) ---
echo "--- security groups ---"
SGS=$(awscurl \
    --data-urlencode "Action=DescribeSecurityGroups" \
    --data-urlencode "Version=2016-11-15" | PREFIX="$PREFIX" python3 -c '
import sys,json,xmltodict,os
j=json.loads(json.dumps(xmltodict.parse(sys.stdin.read())))
items=(j.get("DescribeSecurityGroupsResponse",{}).get("securityGroupInfo") or {}).get("item",[])
if not isinstance(items,list): items=[items]
prefix=os.environ.get("PREFIX","")
for s in items:
    name=s.get("groupName","")
    if name != "default" and name.startswith(prefix): print(s.get("groupId",""), name)
')

while IFS= read -r line; do
    [ -z "$line" ] && continue
    SG_ID=$(echo "$line" | awk '{print $1}')
    NAME=$(echo "$line" | awk '{print $2}')
    echo "  deleting security group $SG_ID ($NAME)"
    awscurl --data-urlencode "Action=DeleteSecurityGroup" \
            --data-urlencode "Version=2016-11-15" \
            --data-urlencode "GroupId=$SG_ID" | grep -o '<return>[^<]*</return>' || true
done <<< "$SGS"

# --- Internet gateways: detach then delete ---
echo "--- internet gateways ---"
IGWS=$(awscurl \
    --data-urlencode "Action=DescribeInternetGateways" \
    --data-urlencode "Version=2016-11-15" | PREFIX="$PREFIX" python3 -c '
import sys,json,xmltodict,os
j=json.loads(json.dumps(xmltodict.parse(sys.stdin.read())))
items=(j.get("DescribeInternetGatewaysResponse",{}).get("internetGatewaySet") or {}).get("item",[])
if not isinstance(items,list): items=[items]
prefix=os.environ.get("PREFIX","")
for gw in items:
    tags=(gw.get("tagSet") or {}).get("item",[])
    if not isinstance(tags,list): tags=[tags]
    name=next((t["value"] for t in tags if t.get("key")=="Name"),"")
    if not name.startswith(prefix): continue
    attach=(gw.get("attachmentSet") or {}).get("item",[])
    if not isinstance(attach,list): attach=[attach]
    vpc_id=next((a.get("vpcId","") for a in attach if a.get("vpcId")),"")
    print(gw.get("internetGatewayId",""), vpc_id)
')

while IFS= read -r line; do
    [ -z "$line" ] && continue
    IGW_ID=$(echo "$line" | awk '{print $1}')
    VPC_ID=$(echo "$line" | awk '{print $2}')
    if [ -n "$VPC_ID" ]; then
        echo "  detaching internet gateway $IGW_ID from $VPC_ID"
        awscurl --data-urlencode "Action=DetachInternetGateway" \
                --data-urlencode "Version=2016-11-15" \
                --data-urlencode "InternetGatewayId=$IGW_ID" \
                --data-urlencode "VpcId=$VPC_ID" | grep -o '<return>[^<]*</return>' || true
    fi
    echo "  deleting internet gateway $IGW_ID"
    awscurl --data-urlencode "Action=DeleteInternetGateway" \
            --data-urlencode "Version=2016-11-15" \
            --data-urlencode "InternetGatewayId=$IGW_ID" | grep -o '<return>[^<]*</return>' || true
done <<< "$IGWS"

# --- VPCs ---
echo "--- VPCs ---"
VPCS=$(awscurl \
    --data-urlencode "Action=DescribeVpcs" \
    --data-urlencode "Version=2016-11-15" | PREFIX="$PREFIX" python3 -c '
import sys,json,xmltodict,os
j=json.loads(json.dumps(xmltodict.parse(sys.stdin.read())))
items=(j.get("DescribeVpcsResponse",{}).get("vpcSet") or {}).get("item",[])
if not isinstance(items,list): items=[items]
prefix=os.environ.get("PREFIX","")
for v in items:
    tags=(v.get("tagSet") or {}).get("item",[])
    if not isinstance(tags,list): tags=[tags]
    name=next((t["value"] for t in tags if t.get("key")=="Name"),"")
    if name.startswith(prefix): print(v.get("vpcId",""), name)
')

while IFS= read -r line; do
    [ -z "$line" ] && continue
    VPC_ID=$(echo "$line" | awk '{print $1}')
    NAME=$(echo "$line" | awk '{print $2}')
    echo "  deleting VPC $VPC_ID ($NAME)"
    awscurl --data-urlencode "Action=DeleteVpc" \
            --data-urlencode "Version=2016-11-15" \
            --data-urlencode "VpcId=$VPC_ID" | grep -o '<return>[^<]*</return>' || true
done <<< "$VPCS"

echo "=== Done ==="
