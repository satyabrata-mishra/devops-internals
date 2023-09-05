#!/bin/bash
aws ec2 authorize-security-group-ingress --group-id sg-093d5b8640a305af9 --protocol tcp --port 22 --cidr 0.0.0.0/0
