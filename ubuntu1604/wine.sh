#!/bin/bash

sudo add-apt-repository -y ppa:noobslab/apps
sudo add-apt-repository -y ppa:wine/wine-builds
sudo apt update
sudo apt -y install --install-recommends winehq-staging
sudo apt install -y playonlinux

