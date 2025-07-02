#!/bin/bash

INPUT_DIR="."   # 🔁 Change this to your folder path
OUTPUT_FILE="sorted_iframes.txt"

# Extract lines with "iframe:<number>", prefix with the number, sort, then remove prefix
grep -h "iframe:[0-9]\+" "$INPUT_DIR"/* | \
  awk '
    match($0, /iframe:([0-9]+)/, m) {
      print m[1], $0
    }
  ' | sort -n | cut -d' ' -f2- > "$OUTPUT_FILE"

echo "Sorted iframe lines written to $OUTPUT_FILE"