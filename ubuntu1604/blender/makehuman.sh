#!/bin/bash

sudo add-apt-repository -y ppa:makehuman-official/makehuman-11x
sudo apt update
sudo apt install -y makehuman

mkdir -p ~/.blender/download

pushd ~/.blender/download

wget http://download.tuxfamily.org/makehuman/releases/1.1.0/blendertools-1.1.0-all.zip

popd

