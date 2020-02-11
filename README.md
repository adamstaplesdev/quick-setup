# Quick Setup scripts for a Linux development environment

## One-line install of core tools and languages

``` bash
wget -O - https://raw.githubusercontent.com/adamstaplesdev/quick-setup/master/quick-setup-core.sh | bash
```

## Included tools and languages in quick-setup-core.sh

- vim
- python 3.6 and pip
- Node.js 13.x (includes npm)
- aws-cli and aws-mfa
- go 1.13.7
- dotnet-sdk-3.1 and Amazon.Lambda.Tools
- Powershell (pwsh)
- terraform 0.12.20
- multipass

## Included tools in quick-setup-docker.sh

- Docker CE

## Included tools in quick-setup-kubectl.sh

- kubectl
- kops

## Configuration scripts

quick-setup-config-aws.sh - set these temporary environment variables before running

- export AWS_ACCESS_KEY_ID=?
- export AWS_SECRET_ACCESS_KEY=?
- export AWS_MFA_DEVICE=?

quick-setup-config-kubectl.sh - set these temporary environment variables before running

- export KOPS_STATE_STORE=?
- export KOPS_STATE_FILE=?

quick-setup-config-git.sh - set these temporary environment variables before running

- export GIT_NAME=?
- export GIT_EMAIL=?
