#!/bin/bash
echo "Enter VPC ID 1"
read vpc_id_1

echo "Enter VPC ID 2"
read vpc_id_2


aws ec2 create-vpc-peering-connection --vpc-id $vpc_id_1 --peer-vpc-id $vpc_id_2
