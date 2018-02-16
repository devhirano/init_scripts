#!/bin/bash

sudo apt update
sudo apt -y install git

# if you have multiple accounts, set user and email separately
git config --global user.useConfigOnly true

# ignore global file
git config --global core.excludesfile ~/.gitignore_global
cp gitignore_global ~/.gitignore_global
