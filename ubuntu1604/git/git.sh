#!/bin/bash

sudo apt update
sudo apt -y install git

# if you have multiple accounts, set user and email separately
git config --global user.useConfigOnly true

# ignore global file
git config --global core.excludesfile ~/.gitignore_global
cp gitignore_global ~/.gitignore_global

grep alias ~/.gitconfig 2>&1 >/dev/null
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

grep 'alias g=' ~/.alias 2>&1 >/dev/null
cat << EOT >> ~/.alias
alias g='git'
alias gs='git s'
alias gl='git l'
alias gd='git diff'
alias gdw='git difff'
EOT
