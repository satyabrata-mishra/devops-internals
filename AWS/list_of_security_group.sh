#!/bin/bash

# Get a list of all security groups
security_groups=$(aws ec2 describe-security-groups --query 'SecurityGroups[*].{Name:GroupName, ID:GroupId}')

# Display the list of security groups
echo "$security_groups"