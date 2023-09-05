#!/bin/bash

# Get the instance ID of the newly created EC2 instance
echo "Enter your instance id"

read instance_id

ec2 describe-instances \
--filters \
"Name=instance-state-name,Values=running" \
'Name=instance-id,Values=${instance_id}' \
--query 'Reservations[*].Instances[*].[PrivateIpAddress, PublicIpAddress]' \
--output text
