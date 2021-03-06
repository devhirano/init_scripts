#!/bin/bash

set -ex

TEMP="/var/tmp/vim-source"

mkdir -p $TEMP
rm -rf $TEMP/*

which npm >/dev/null 2>&1 || ./nodejs-2018.sh

sudo dnf -y install ncurses ncurses-devel lua-devel ctags-etags python-devel python3-devel ruby-devel && \
    git clone https://github.com/vim/vim $TEMP/vim && \
    pushd $TEMP/vim && \
    make distclean && \
        LDFLAGS="-Wl,-rpath=${HOME}/.pyenv/versions/2.7.15/lib:${HOME}/.pyenv/versions/3.5.3/lib" \
        ./configure --with-features=huge --enable-multibyte \
        --enable-luainterp=dynamic --enable-gpm \
        --enable-cscope --enable-fontset --enable-fail-if-missing \
        --prefix=/usr/local \
        --enable-pythoninterp=dynamic \
        --enable-python3interp=dynamic \
        --enable-rubyinterp \
        --enable-luainterp \
    && \
    make && \
    sudo make install && \
    popd

# install syntastic libs
pip install flake8
cp ~/.flake8{,.bak} >/dev/null 2>&1 && echo "~/.flake8 is backed up to ~/.flake8.bak"
pwd
cp -p flake8 ~/.flake8

pip install jedi
npm -g install coffeelint

# install vim-autoformat
pip install autopep8 yapf

# install neobundle
TEMPDIR=$(mktemp -d)
pushd $TEMPDIR
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
chmod +x ./install.sh
sh ./install.sh
popd
rm -rf $TEMPDIR

mkdir -p ~/.vim/colors

# colors
grep "Hybrid Terminal Colours." ~/.Xresources 2>/dev/null 1>/dev/null || cat Xresources >> ~/.Xresources
curl -o ~/.vim/colors/hybrid.vim https://raw.githubusercontent.com/w0ng/vim-hybrid/master/colors/hybrid.vim

pwd
cp vimrc ~/.vimrc

# install plugins
vim +NeoBundleInstall +qall

# disable install YCM
# pushd ~/.vim/bundle/YouCompleteMe/
# ./install.py --clang-completer
# popd

# TAGLIST
cp -pR taglist/* ~/.vim/
