#!/bin/sh
# Linux development environment setup for kubectl

echo '----- Using the following environment variables for configuration:'
echo 'KOPS_STATE_FILE KUBECFG_FILENAME'

echo '----- Initializing kubecfg'
echo "export KOPS_STATE_STORE=${KOPS_STATE_STORE}" >> ~/.bashrc
kops export kubecfg ${KOPS_STATE_FILE}
source ~/.bashrc

echo '----- kubectl/kops configuration complete.'