#!/bin/sh
# Linux development environment setup for aws credentials
# See https://github.com/broamski/aws-mfa for details on what this script is doing.

echo '----- Using the following environment variables for configuration:'
echo 'AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_MFA_DEVICE'

echo '----- Configuring AWS credentials'
echo '[default-long-term]' >> ~/.aws/credentials
echo "aws_mfa_device = ${AWS_MFA_DEVICE}" >> ~/.aws/credentials
echo "aws_access_key_id = ${AWS_ACCESS_KEY_ID}" >> ~/.aws/credentials
echo "aws_secret_access_key = ${AWS_SECRET_ACCESS_KEY}" >> ~/.aws/credentials