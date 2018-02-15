#!/bin/bash

sudo sed -i.bak "/^# deb .*partner/ s/^# //" /etc/apt/sources.list 
sudo apt update

# Skype
sudo apt install -y skype pulseaudio

# Skype for business
sudo apt install -y pidgin pidgin-sipe
