#!/bin/bash

PKGS=("curl")

sudo apt update

for p in ${PKGS[@]}
do
echo $p
sudo apt install -y $p
done
