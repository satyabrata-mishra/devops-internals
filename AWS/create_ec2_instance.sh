#!/bin/bash

#Create a VPC
vpc_id=$(aws ec2 create-vpc --cidr-block 10.0.0.0/16 --query Vpc.VpcId --output text)
echo "VPC ID is $vpc_id"

#Creating a subnet and connecting it to the VPC
aws ec2 create-subnet --vpc-id $vpc_id --cidr-block 10.0.1.0/24
subnet_id=$(aws ec2 describe-subnets --filter "Name=vpc-id,Values=$vpc_id" --query "Subnets[*].SubnetId" --output text)
echo "Subnet ID is $subnet_id"

#Create a Internet Gateway
internet_gateway=$(aws ec2 create-internet-gateway --query InternetGateway.InternetGatewayId --output text)
echo "Internet Gateway ID is $internet_gateway"

#Attach Internet Gateway to the VPC
aws ec2 attach-internet-gateway --vpc-id $vpc_id --internet-gateway-id $internet_gateway
echo "Internet Gateway connected to VPC"

#Create a Custom Route Table
route_table_id=$(aws ec2 create-route-table --vpc-id $vpc_id --query RouteTable.RouteTableId --output text)
echo "Custom Route Table id is $route_table_id"

#Create a route in the route table that points all traffic (0.0.0.0/0 ) to the internet gateway
route=$(aws ec2 create-route --route-table-id $route_table_id --destination-cidr-block 0.0.0.0/0 --gateway-id $internet_gateway)
echo "$route"

#Associate Route Table with subnet
aws ec2 associate-route-table --route-table-id $route_table_id --subnet-id $subnet_id

#Create a security group connecting to VPC id
echo "Enter security group name"
read name
aws ec2 create-security-group --group-name $name --description "Security group" --vpc-id $vpc_id
group_id=$(aws ec2 describe-security-groups --filter Name=vpc-id,Values=$vpc_id Name=group-name,Values=$name --query 'SecurityGroups[*].[GroupId]' --output text)
echo "$group_id"

#Add inbound rules to the security group that you created
aws ec2 authorize-security-group-ingress --group-id $group_id --protocol all --port all --cidr 0.0.0.0/0
aws ec2 authorize-security-group-ingress --group-id $group_id --protocol tcp --port 22 --cidr 0.0.0.0/0

#Create a key pair to connect to the instance
echo "Enter key pair name"
read key
aws ec2 create-key-pair --key-name $key --key-type rsa --key-format pem --query "KeyMaterial"  --output text > $key.pem

#Launch a EC2 instance using all the security features
aws ec2 run-instances --image-id ami-053b0d53c279acc90 --count 1 --instance-type t2.micro --key-name $key --security-group-ids $group_id --associate-public-ip-address --subnet-id $subnet_id > $key.json
echo "Instance Created."