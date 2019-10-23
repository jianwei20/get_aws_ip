#!/bin/bash

AWS_PROFILE="fsbft"
AWS_REGION="us-east-1"


EC2_HOST=$(aws ec2 describe-instances --profile=$AWS_PROFILE --region $AWS_REGION  --output=json | jq -r '.Reservations[].Instances[].PublicIpAddress | select(. != null)' | tr '\n' ' ')

echo $EC2_HOST

