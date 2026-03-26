#!/usr/bin/env bash

# Read all stdin
input="$(cat)"

# Trim leading whitespace for detection
trimmed="$(echo "$input" | sed -e 's/^[[:space:]]*//')"

# Detect JSON
if echo "$trimmed" | grep -qE '^[\{\[]'; then
    echo "$input" | jq .
    exit 0
fi

# Detect XML
if echo "$trimmed" | grep -qE '^<\?xml|^<'; then
    echo "$input" | python3 - <<'EOF'
import sys, json, xmltodict
try:
    data = xmltodict.parse(sys.stdin.read())
    print(json.dumps(data, indent=2))
except Exception as e:
    print(sys.stdin.read())
EOF
    exit 0
fi

# Fallback: just echo
echo "$input"