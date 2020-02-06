#!/bin/sh
# Linux development environment quick-setup

# Setup folder for downloading packages
echo ----- Creating download directory ~/Downloads/quick-setup
TEMPDIR=~/Downloads/quick-setup
mkdir -p $TEMPDIR

# Setup common necessary apt packages
echo ----- Updating apt repositories and installing common build tools
sudo apt update
sudo apt install -y build-essential

echo ----- Installing Python 3.6 (python3) and Pip (pip3)
sudo apt install -y python3
sudo apt install -y python3-pip

echo ----- Installing aws-cli and aws-mfa, see https://github.com/broamski/aws-mfa for help setting up ~/.aws/credentials for mfa
pip3 install awscli --upgrade --user
pip3 install aws-mfa
mkdir ~/.aws
echo '[default-long-term]' >> ~/.aws/credentials

echo ----- Installing Go 1.13.7, see https://golang.org/doc/install#install for more information
wget -O $TEMPDIR/go1.13.7.linux-amd64.tar.gz https://dl.google.com/go/go1.13.7.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf $TEMPDIR/go1.13.7.linux-amd64.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
echo 'export GOPATH=$HOME/go' >> ~/.bashrc



echo ----- Loading newly-created environment variables.
source ~/.bashrc