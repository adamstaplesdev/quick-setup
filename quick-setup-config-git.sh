#!/bin/sh
# Linux development environment setup for git name and email
# See https://confluence.atlassian.com/bitbucket/configure-your-dvcs-username-for-commits-950301867.html

echo '----- Using the following environment variables for configuration:'
echo 'GIT_NAME GIT_EMAIL'

echo '----- Configuring AWS credentials'
git config --global credential.helper store
git config --global user.name "${GIT_NAME}"
git config --global user.email "${GIT_EMAIL}"

echo '----- Git configuration complete.'