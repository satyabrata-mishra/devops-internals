#!bin/bash
echo "Enter your EC2 Instance ID"
read id

#Delete the Key Pair Associated with the instance
keyPairName=$(aws ec2 describe-instances --instance-ids $instance_id --query 'Reservations[].Instances[].KeyName' --output text)
aws ec2 delete-key-pair --key-name $keyPairName
rm "$keyPairName.pem"

#Delete the EC2 Instance
aws ec2 terminate-instances --instance-ids $id
