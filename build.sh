#/bin/bash

### install neovim unstable version (with lsp)
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update -y 
sudo apt-get install -y neovim

### install npm
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs

### install python3 
sudo apt install -y python3 python3-dev python3-pip

### install intelephense
npm install -g intelephense

### install gopls
go get golang.org/x/tools/gopls@latest

### install bashls
npm i -g bash-language-server

### config clipboard ----> only wsl2 config 
curl -sLo/tmp/win32yank.zip https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip
unzip -p /tmp/win32yank.zip win32yank.exe > /tmp/win32yank.exe
chmod +x /tmp/win32yank.exe
mv /tmp/win32yank.exe /usr/local/bin

### install ag support
sudo apt install -y silversearcher-ag
