#!/bin/bash

# http://qiita.com/seibe/items/36cef7df85fe2cefa3ea

sudo apt update
sudo apt install -y nodejs npm
sudo npm cache clean
sudo npm install n -g
sudo n stable
sudo ln -sf /usr/local/bin/node /usr/bin/node
node -v
sudo apt-get purge -y nodejs npm


