#! /bin/bash
echo "Enter bucket name"
read name


OBJ=$(aws s3api list-objects --bucket $name --output text --query 'Contents[].{Key: Key, Size: Size}')
echo "Number of objects and size : $OBJ"

aws s3 ls --summarize --human-redable --recursive s3://$name
