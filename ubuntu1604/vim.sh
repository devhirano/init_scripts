#!/bin/bash

sudo apt update
sudo apt install vim -y

mkdir -p ~/.vim/colors

# colors
curl -o ~/.vim/colors/hybrid.vim https://raw.githubusercontent.com/w0ng/vim-hybrid/master/colors/hybrid.vim

cp vimrc ~/.vimrc
