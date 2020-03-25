#!/bin/sh
# Linux development environment setup for programming languages, sdks, and packages

# Variables to define tool versions
NODE_VER=13.x
GO_VER=1.13.7
TER_VER=0.12.20
NET_CORE_VER=3.1

# Setup folder for downloading packages
TEMPDIR=~/quick-setup
echo "Creating download directory ${TEMPDIR}"
mkdir -p $TEMPDIR

# Setup common necessary apt packages
echo '----- Installing vim, curl and common build tools'
sudo add-apt-repository universe && sudo apt update
sudo apt install -y build-essential vim curl git wget unzip apt-transport-https ca-certificates software-properties-common bash-completion

echo '----- Installing python3 and pip3'
sudo apt install -y python3 python3-pip

echo "----- Installing Node.js ${NODE_VER}, npm, and yarn"
curl -sL https://deb.nodesource.com/setup_${NODE_VER} | sudo -E bash -
sudo apt install -y nodejs
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn

echo '----- Installing aws-cli and aws-mfa, see https://github.com/broamski/aws-mfa for help setting up ~/.aws/credentials for mfa'
pip3 install awscli --upgrade --user
pip3 install aws-mfa --user
mkdir ~/.aws

echo "----- Installing Go ${GO_VER}, see https://golang.org/doc/install#install for more information"
wget -O ${TEMPDIR}/go${GO_VER}.linux-amd64.tar.gz https://dl.google.com/go/go${GO_VER}.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf ${TEMPDIR}/go${GO_VER}.linux-amd64.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
echo 'export GOPATH=$HOME/go' >> ~/.bashrc

echo "----- Installing .NET Core ${NET_CORE_VER} sdk and Amazon.Lambda.Tools"
wget https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O ${TEMPDIR}/packages-microsoft-prod.deb
sudo dpkg -i ${TEMPDIR}/packages-microsoft-prod.deb
sudo apt update && sudo apt install dotnet-sdk-${NET_CORE_VER}
dotnet new -i 'Amazon.Lambda.Templates::*'

echo "----- Installing Powershell"
wget -O - https://aka.ms/install-powershell.sh | sudo bash
#Bug: standard folders created and owned by root, normal user will occasionally see errors. This fixes the permissions issue.
pwsh -command '$refDir = Resolve-Path "~"; $dstDir = Resolve-Path "~/.local/share/powershell"; sudo chown -R --reference=$refDir $dstDir'

echo "----- Installing Terraform ${TER_VER}"
wget -O ${TEMPDIR}/terraform_${TER_VER}_linux_amd64.zip https://releases.hashicorp.com/terraform/${TER_VER}/terraform_${TER_VER}_linux_amd64.zip
unzip ${TEMPDIR}/terraform_${TER_VER}_linux_amd64.zip -d ${TEMPDIR}
sudo mv ${TEMPDIR}/terraform /usr/local/bin/

echo '----- Loading newly-created environment variables, and cleaning up unused packages'
#Cleanup: When setting up both .Net Core and Pwsh, the same package repository is registered in 2 separate files:
#microsoft.list and microsoft-prod.list
#Delete the duplicate to get rid of noisy warnings in apt output.
sudo rm /etc/apt/sources.list.d/microsoft-prod.list
rm -rf ${TEMPDIR}
source ~/.bashrc
sudo apt update && sudo apt autoremove

echo '----- Core tools setup complete.'