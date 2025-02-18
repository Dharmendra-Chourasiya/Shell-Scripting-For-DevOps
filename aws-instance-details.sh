#!/bin/bash

set -euo pipefail

check_awscli() {

# Check if AWS CLI is installed
if ! command -v aws &> /dev/null; then
    echo "AWS CLI is not installed. Please install it first."
    exit 1
fi
}

fetch_instance() {

# Fetch instance details
echo "Fetching AWS EC2 instance details..."
aws ec2 describe-instances --query 'Reservations[*].Instances[*].[InstanceId,Tags[?Key==`Name`].Value | [0],InstanceType,State.Name,PublicIpAddress,PrivateIpAddress]' --output table

}

main() {
	check_awscli
	fetch_instance
}

main "$@"
