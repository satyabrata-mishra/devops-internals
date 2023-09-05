#!/bin/bash

#Create User
#aws iam create-user --user-name Bob


#Create as well as give permission at the same time
#aws iam create-user --user-name Bob --permissions-boundary arn:aws:iam::aws:policy/AmazonS3FullAccess

#Give policy permission
#aws iam attach-user-policy --policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess --user-name Bob