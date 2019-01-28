#!/bin/bash

set -u

if [ -z "$GOPATH" ];then
  echo "Have to install golang to use hub command."
  exit 1
fi

sudo apt update
sudo apt -y install git

# if you have multiple accounts, set user and email separately
git config --global user.useConfigOnly true

# ignore global file
git config --global core.excludesfile ~/.gitignore_global
cp gitignore_global ~/.gitignore_global


mkdir -p "$GOPATH"/src/github.com/github
git clone \
  --config transfer.fsckobjects=false \
  --config receive.fsckobjects=false \
  --config fetch.fsckobjects=false \
  https://github.com/github/hub.git "$GOPATH"/src/github.com/github/hub
cd "$GOPATH"/src/github.com/github/hub
make install prefix=/usr/local


grep alias ~/.gitconfig >/dev/null 2>&1
if [ $? -ne 0 ];then
cat << EOT >> ~/.gitconfig
[alias]
    gr = log --graph --date=short --decorate=short --pretty=format:'%Cgreen%h %Creset%cd %Cblue%cn %Cred%d %Creset%s'
    l = log --graph --date=short --decorate=short --pretty=format:'%Cgreen%h %Creset%cd %Cblue%cn %Cred%d %Creset%s'
    s = status
    cm = commit
    co = checkout
    su = status -uno
    d = diff
    dw = diff --word-diff
    difff = diff --word-diff
EOT
fi

grep 'alias g=' ~/.alias >/dev/null 2>&1
cat << EOT >> ~/.alias
alias g='git'
alias gh='hub'
alias ghe='GITHUB_HOST= hub'
alias gs='git s'
alias gl='git l'
alias gd='git diff'
alias gdw='git difff'
EOT

grep 'source ~/.alias' ~/.bashrc >/dev/null 2>&1
if [ $? != 0 ];then
cat << EOT >> ~/.bashrc

source ~/.alias
EOT
fi

source ~/.alias
