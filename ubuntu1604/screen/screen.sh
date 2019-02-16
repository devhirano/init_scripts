#!/bin/bash

sudo apt update
sudo apt -y install screen xsel

mkdir -p ~/.screen
cp bin/clipboard_exchange.sh ~/.screen
cp bin/upower_p.sh ~/.screen

cp screenrc ~/.screenrc
