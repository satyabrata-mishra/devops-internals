#!/bin/bash

# Get the instance ID of the newly created EC2 instance
echo "Enter your instance id"

read instance_id

# Extract the public IP address using the AWS CLI

public_ip=$(aws ec2 describe-instances --instance-ids "$instance_id" --query 'Reservations[].Instances[].PublicIpAddress' --output text)

# Print the public IP address

echo "Public IP address: $public_ip"
