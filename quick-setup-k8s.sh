#!/bin/sh
# Linux development environment setup for docker.

# Variables to define tool versions
DOCKER_LTS=bionic
KUBECTL_VER=`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`
KOPS_VER=$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)

# Setup folder for downloading packages
TEMPDIR=~/quick-setup
echo "Creating download directory ${TEMPDIR}"
mkdir -p $TEMPDIR

echo "----- Installing Docker for Ubuntu ${DOCKER_LTS}, as LTS has better support and frequent updates"
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add –
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu ${DOCKER_LTS} stable"
sudo apt update
sudo apt install docker-ce
sudo systemctl start docker
sudo systemctl enable docker

echo "----- Installing kubectl and kops"
curl -o ${TEMPDIR}/kubectl -L https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VER}/bin/linux/amd64/kubectl
chmod +x ${TEMPDIR}/kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
echo 'alias k=kubectl' >> ~/.bashrc
curl -Lo ${TEMPDIR}/kops https://github.com/kubernetes/kops/releases/download/${KOPS_VER}/kops-linux-amd64
chmod +x ${TEMPDIR}/kops
sudo mv ${TEMPDIR}/kops /usr/local/bin/
source ~/.bashrc

echo '----- Docker, kubectl, and kops setup complete.'