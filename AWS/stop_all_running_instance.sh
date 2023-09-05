#!/bin/bash
#Bash script to find and stop all running instance

#To find all running instances
aws ec2 describe-instances --query "Reservations[*].Instances[*].{InstanceId:InstanceId,Status:State.Name}" --filters "Name=instance-state-name,Values=running"

#To fetch instance id
op=$(aws ec2 describe-instances --query "Reservations[*].Instances[*].{InstanceId:InstanceId}" --filters "Name=instance-state-name,Values=running" --output text)

#Stop a running instance
aws ec2 stop-instances --instance-ids $op