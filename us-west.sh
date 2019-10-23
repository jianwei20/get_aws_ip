#!/bin/bash

AWS_PROFILE="fsbft"
AWS_REGION="us-west-2"
ASG_NAME="stag-fsbft-geth-nodes"

EC2_HOST=$(aws ec2 describe-instances --profile=$AWS_PROFILE --region $AWS_REGION --filter Name=tag:aws:autoscaling:groupName,Values=$ASG_NAME --output=json | jq -r '.Reservations[].Instances[].PublicIpAddress | select(. != null)' | tr '\n' ' ')

echo $EC2_HOST

