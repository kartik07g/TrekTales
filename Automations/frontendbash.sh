#!/bin/bash

# Set the Instance ID
INSTANCE_ID="i-0abcdef123456789"

# Retrieve the public IP address of the specified EC2 instance
ipv4_address=$(aws ec2 describe-instances --instance-ids "$INSTANCE_ID" --query 'Reservations[0].Instances[0].PublicIpAddress' --output text)

# Path to the .env file
file_to_find="../frontend/.env.sample"

# Desired new VITE_API_PATH value
new_url="VITE_API_PATH=\"http://${ipv4_address}:31100\""

# Check if file exists
if [ ! -f "$file_to_find" ]; then
    echo "ERROR: File not found at $file_to_find"
    exit 1
fi

# Get current VITE_API_PATH line
current_url=$(grep '^VITE_API_PATH=' "$file_to_find")

# Update only if the IP has changed
if [[ "$current_url" != "$new_url" ]]; then
    echo "Updating VITE_API_PATH to http://${ipv4_address}:31100"
    sed -i -e "s|^VITE_API_PATH=.*|$new_url|g" "$file_to_find"
else
    echo "VITE_API_PATH is already up to date."
fi
