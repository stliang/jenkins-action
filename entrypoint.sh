#!/bin/sh

# Exit immediately if any command fails and unset variables are used
set -eu

# Capture all the arguments supplied to the script
args="$@"

# Run the `drone-jenkins` command with the provided arguments and capture its output
output=$(/bin/drone-jenkins $args 2>&1)

# Check if the output contains the status codes 200 or 201
if echo "$output" | grep -qE "200|201"; then
    echo "Success: Found 200 or 201 in the output."
    exit 0
else
    echo "Error: Neither 200 nor 201 found in the output."
    echo "Command output:"
    echo "$output"
    exit 1
fi
