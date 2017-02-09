#!/bin/bash

sudo apt update
sudo apt -y install terminator

if [ "$1" == "cpconfig" ];then
  mkdir -p ~/.config/terminator
  cp config ~/.config/terminator/config
fi
