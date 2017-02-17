#!/bin/bash

sudo apt update
sudo apt install vim vim-gnome build-essential cmake python-dev python3-dev

# install neobundle
pushd /tmp
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
chmod +x ./install.sh
sh ./install.sh
popd

mkdir -p ~/.vim/colors

# colors
curl -o ~/.vim/colors/hybrid.vim https://raw.githubusercontent.com/w0ng/vim-hybrid/master/colors/hybrid.vim
cp vimrc ~/.vimrc

# install plugins
vim +NeoBundleInstall +qall

pushd ~/.vim/bundle/YouCompleteMe/
./install.py --clang-completer
popd
