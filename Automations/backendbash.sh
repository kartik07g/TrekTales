#!/bin/bash

INSTANCE_ID="i-0abcdef123456789"
file_to_find="../backend/.env.sample"

# Get EC2 Public IP
ipv4_address=$(aws ec2 describe-instances --instance-ids "$INSTANCE_ID" --query 'Reservations[0].Instances[0].PublicIpAddress' --output text)

# Ensure file exists
if [ ! -f "$file_to_find" ]; then
    echo "ERROR: File not found at $file_to_find"
    exit 1
fi

# Extract current FRONTEND_URL
current_url=$(grep '^FRONTEND_URL=' "$file_to_find")

# Desired new URL
new_url="FRONTEND_URL=\"http://${ipv4_address}:5173\""

# Update only if needed
if [[ "$current_url" != "$new_url" ]]; then
    echo "Updating FRONTEND_URL to http://${ipv4_address}:5173"
    sed -i -e "s|^FRONTEND_URL=.*|$new_url|g" "$file_to_find"
else
    echo "FRONTEND_URL is already up to date."
fi
