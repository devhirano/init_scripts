#!/bin/bash -ex

which pyenv >/dev/null 2>&1
if [ $? -ne 0 ];then
  echo "should instal pyenv before"
  exit 1
fi

sudo apt purge -y vim vim-runtime vim-common
sudo apt install -y git build-essential ncurses-dev lua5.2 lua5.2-dev luajit python-dev python3-dev ruby-dev
TEMP=$(mktemp -d)
git clone https://github.com/vim/vim $TEMP/vim
pushd $TEMP/vim
sudo ./configure --with-features=huge --enable-multibyte \
--enable-luainterp=dynamic --enable-gpm \
--enable-cscope --enable-fontset --enable-fail-if-missing \
--prefix=/usr/local \
--enable-pythoninterp=dynamic \
--enable-python3interp=dynamic \
--enable-rubyinterp=dynamic \
--enable-tclinterp=dynamic
sudo make
sudo make install
popd
sudo rm -rf $TEMP
