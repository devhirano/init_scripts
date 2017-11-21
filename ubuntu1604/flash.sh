#!/bin/bash

sudo sh -c 'echo "deb http://archive.canonical.com/ubuntu yakkety partner" > /etc/apt/sources.list.d/adobe.list' && \
sudo apt update && sudo apt install -y adobe-flashplugin


