#!/bin/bash

sudo apt update
sudo apt -y install gdebi-core

DIR=$(mktemp -d)
pushd $DIR

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

yes | sudo gdebi google-chrome-stable_current_amd64.deb

popd

rm -rf $DIR

