#!/bin/sh
# Linux development environment setup for kubernetes.

# Variables to define tool versions
KUBECTL_VER=`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`
KOPS_VER=$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)

# Setup folder for downloading packages
TEMPDIR=~/quick-setup
echo "Creating download directory ${TEMPDIR}"
mkdir -p $TEMPDIR

echo "----- Installing kubectl and kops"
curl -o ${TEMPDIR}/kubectl -L https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VER}/bin/linux/amd64/kubectl
chmod +x ${TEMPDIR}/kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
echo 'alias k=kubectl' >> ~/.bashrc
curl -Lo ${TEMPDIR}/kops https://github.com/kubernetes/kops/releases/download/${KOPS_VER}/kops-linux-amd64
chmod +x ${TEMPDIR}/kops
sudo mv ${TEMPDIR}/kops /usr/local/bin/

echo '----- Loading newly-created environment variables, and cleaning up unused packages'
source ~/.bashrc
sudo apt-get update
sudo apt-get autoremove