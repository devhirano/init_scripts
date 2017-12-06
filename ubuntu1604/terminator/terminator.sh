#!/bin/bash

sudo apt update && \
sudo apt -y install terminator

mkdir -p ~/.config/terminator

if [ -a "~/.config/terminator/config" ]; then
    echo "copy backup ~/.config/terminator/config to config.bak"
    cp ~/.config/terminator/config ~/.config/terminator/config.bak
fi
cp config ~/.config/terminator/config
