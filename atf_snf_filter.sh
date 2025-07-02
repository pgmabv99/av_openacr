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

# Function to split line while preserving quoted strings
split_line() {
    local line="$1"
    local result=()
    local current=""
    local in_quotes=false
    local quote_char=""
    
    # Process each character
    for ((i=0; i<${#line}; i++)); do
        char="${line:$i:1}"
        
        if [[ "$char" == "\"" || "$char" == "'" ]]; then
            if [[ "$in_quotes" == false ]]; then
                in_quotes=true
                quote_char="$char"
                current+="$char"
            elif [[ "$char" == "$quote_char" ]]; then
                in_quotes=false
                quote_char=""
                current+="$char"
            else
                current+="$char"
            fi
        elif [[ "$char" == " " && "$in_quotes" == false ]]; then
            if [[ -n "$current" ]]; then
                result+=("$current")
                current=""
            fi
        else
            current+="$char"
        fi
    done
    
    # Add the last token if exists
    if [[ -n "$current" ]]; then
        result+=("$current")
    fi
    
    # Print each token indented
    for token in "${result[@]}"; do
        echo "  $token"
    done
}

# Read the input file, filter lines, and process
while IFS= read -r line; do
    # Check if line contains kafka2.JoinGroup, kafka2.FindCoordinator, or kafka2.SyncGroup
    if echo "$line" | grep -q -E "kafka2\.(JoinGroup|FindCoordinator|SyncGroup)"; then
        # Write the original line
        echo "$line" >> "$output_file"
        # Split line while preserving quoted strings
        split_line "$line" >> "$output_file"
    fi
done < "$input_file"

echo "Processed lines written to $output_file"