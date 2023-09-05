#!/bin/bash

echo "Enter the name of key pair"
read name

aws ec2 create-key-pair \
    --key-name $name \
    --key-type rsa \
    --key-format pem \
    --query "KeyMaterial" \
    --output text > $name.pem
