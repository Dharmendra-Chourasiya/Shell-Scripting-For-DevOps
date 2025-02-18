#!/bin/bash

set -euo pipefail

check_awscli() {

    if  command -v aws &> /dev/null; then
        echo "AWS CLI is alreay installed. Exiting." 
        exit 0
    fi
}

install_awscli() {

     echo "Installing AWS CLI v2 on Linux..."

     # Download and install AWS CLI v2
     
     curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
     sudo apt-get install -y unzip
     unzip awscliv2.zip
     sudo ./aws/install

     # Verify Installation
     
     aws --version

     # Clean up

     rm -rf awscliv2.zip aws
}

main() {

check_awscli
install_awscli
}
main "$@"
