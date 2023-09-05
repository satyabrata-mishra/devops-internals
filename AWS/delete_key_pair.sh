#!/bin/bash
echo "Enter name of key pair"
read name

aws ec2 delete-key-pair --key-name $name
