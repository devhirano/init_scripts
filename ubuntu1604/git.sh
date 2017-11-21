#!/bin/bash

sudo apt update
sudo apt -y install git

# if you have multiple accounts, set user and email separately
git config --global user.useConfigOnly true
