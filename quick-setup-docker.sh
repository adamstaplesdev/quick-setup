#!/bin/sh
# Linux development environment setup for docker.

# Variables to define tool versions
DOCKER_LTS=bionic

# Setup folder for downloading packages
TEMPDIR=~/quick-setup
echo "Creating download directory ${TEMPDIR}"
mkdir -p $TEMPDIR

echo "----- Installing Docker for Ubuntu ${DOCKER_LTS}, as LTS has better support and frequent updates"
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add –
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu ${DOCKER_LTS} stable"
sudo apt-get update
sudo apt-get install docker-ce
sudo systemctl start docker
sudo systemctl enable docker

echo '----- Loading newly-created environment variables and aliases, and cleaning up unused packages'
source ~/.bashrc
sudo apt-get update
sudo apt-get autoremove