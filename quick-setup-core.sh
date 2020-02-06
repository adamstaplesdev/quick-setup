#!/bin/sh
# Linux development environment setup for programming languages, sdks, and packages

# Variables to define tool versions
GO_VER=1.13.7
TER_VER=0.12.20
NET_CORE_VER=3.1

# Setup folder for downloading packages
TEMPDIR=~/quick-setup
echo "Creating download directory ${TEMPDIR}"
mkdir -p $TEMPDIR

# Setup common necessary apt packages
echo '----- Updating apt repositories and installing common build tools'
sudo add-apt-repository universe
sudo apt update
sudo apt install -y build-essential git apt-transport-https ca-certificates curl software-properties-common

echo '----- Installing python3 and pip3'
sudo apt install -y python3
sudo apt install -y python3-pip

echo '----- Installing aws-cli and aws-mfa, see https://github.com/broamski/aws-mfa for help setting up ~/.aws/credentials for mfa'
pip3 install awscli --upgrade --user
pip3 install aws-mfa
mkdir ~/.aws

echo "----- Installing Go ${GO_VER}, see https://golang.org/doc/install#install for more information"
wget -O ${TEMPDIR}/go${GO_VER}.linux-amd64.tar.gz https://dl.google.com/go/go${GO_VER}.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf ${TEMPDIR}/go${GO_VER}.linux-amd64.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
echo 'export GOPATH=$HOME/go' >> ~/.bashrc

echo "----- Installing .NET Core ${NET_CORE_VER} sdk and Amazon.Lambda.Tools"
sudo apt install dotnet-sdk-${NET_CORE_VER}
dotnet new -i 'Amazon.Lambda.Templates::*'

echo "----- Installing Terraform ${TER_VER}"
wget -O ${TEMPDIR}/terraform_${TER_VER}_linux_amd64.zip https://releases.hashicorp.com/terraform/${TER_VER}/terraform_${TER_VER}_linux_amd64.zip
unzip terraform_${TER_VER}_linux_amd64.zip
sudo mv terraform /usr/local/bin/

echo "----- Installing Multipass"
snap install multipass --classic

echo '----- Loading newly-created environment variables, and cleaning up unused packages'
source ~/.bashrc
sudo apt update
sudo apt autoremove

echo '----- Core tools setup complete.'