#!/bin/sh
# Linux development environment setup for Visual Studio Code.

echo "----- Installing VS Code"
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update
sudo apt install -y code

echo "----- Installing VS Code extensions for language support and other useful things"
code --install-extension ms-vscode.csharp --force
code --install-extension k--kato.docomment --force
code --install-extension jchannon.csharpextensions --force
code --install-extension ms-vscode.go --force
code --install-extension ms-python.python --force
code --install-extension ms-vscode.powershell --force
code --install-extension ms-azuretools.vscode-docker --force
code --install-extension mauve.terraform --force
code --install-extension github.vscode-pull-request-github --force
code --install-extension bigous.vscode-multi-line-tricks --force
code --install-extension eriklynd.json-tools --force
code --install-extension dotjoshjohnson.xml --force
code --install-extension mitchdenny.ecdc --force
code --install-extension adamhartford.vscode-base64 --force
code --install-extension grapecity.gc-excelviewer --force
code --install-extension davidanson.vscode-markdownlint --force
code --install-extension eg2.vscode-npm-script --force
code --install-extension jmrog.vscode-nuget-package-manager --force
code --install-extension mohsen1.prettify-json --force
code --install-extension tyriar.shell-launcher --force

echo '----- VS Code setup complete.'