#!/bin/bash

# Define input and output files
input_file="sorted_iframes.txt"
output_file="split_kafka_output.txt"

# Check if input file exists
if [ ! -f "$input_file" ]; then
    echo "Input file $input_file not found!"
    exit 1
fi

# Clear or create output file
> "$output_file"

# Read the input file, filter lines, and split tokens
while IFS= read -r line; do
    # Check if line contains kafka2.JoinGroup, kafka2.FindCoordinator, or kafka2.SyncGroup
    if echo "$line" | grep -q -E "kafka2\.(JoinGroup|FindCoordinator|SyncGroup)"; then
        # Write the original line
        echo "$line" >> "$output_file"
        # Split line by whitespace, indent non-empty tokens with two spaces, and write to output
        echo "$line" | tr ' ' '\n' | grep -v '^$' | sed 's/^/  /' >> "$output_file"
    fi
done < "$input_file"

echo "Processed lines written to $output_file"