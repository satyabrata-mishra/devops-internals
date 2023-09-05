#!/bin/bash
echo "Enter VPC ID"
read id

aws ec2 delete-vpc --vpc-id $id
