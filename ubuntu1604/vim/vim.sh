#!/bin/bash -e

howtoreinstallvim () {
cat << 'EOT'

---------------------
* should not use 'sudo', it has no pyenv info.

$ sudo su
# apt purge vim vim-runtime vim-common
# apt install -y git build-essential ncurses-dev lua5.2 lua5.2-dev luajit python-dev python3-dev ruby-dev
# TEMP=$(mktemp -d)
# git clone https://github.com/vim/vim $TEMP/vim
# pushd $TEMP/vim
# ./configure --with-features=huge --enable-multibyte \
--enable-luainterp=dynamic --enable-gpm \
--enable-cscope --enable-fontset --enable-fail-if-missing \
--prefix=/usr/local \
--enable-python3interp=dynamic --enable-rubyinterp=dynamic
# make
# make install
---------------------

: still static switch by option for to select python version 2 or 3
: replace to --enable-pythoninterp=dynamic if you need

EOT
}

set +e
if [ "$1" != "-f" ];then
    vim --version |grep -e "+python3/dyn" >/dev/null 2>&1
    if [ $? -ne 0 ];then
        echo "Python dynamic link library is disabled, so you would have some limitations."
        echo "Set '-f' to install if you don't care."
        echo
        echo "Or, you MAYBE can re-install vim as follows."
        howtoreinstallvim
        exit 1
    fi

    vim --version |grep -e "+lua/dyn" >/dev/null 2>&1
    if [ $? -ne 0 ];then
        echo "Lua dynamic link library is disabled, so you would have some limitations."
        echo "Set '-f' to install if you don't care."
        echo
        echo "Or, you MAYBE can re-install vim as follows."
        howtoreinstallvim
        exit 1
    fi
fi
set -e

sudo apt update
sudo apt install -y vim vim-gnome build-essential cmake python-dev python3-dev exuberant-ctags npm

#" install syntastic libs
pip install flake8
set +e
mv ~/.flake8 ~/.flake8.bak >/dev/null 2>&1
if [ $? = 0 ];then
    echo "~/.flake8 is backed up to ~/.flake8.bak"
fi
set -e
cp flake8 ~/.flake8

pip install jedi
sudo npm -g install coffeelint

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
set +e
grep "Hybrid Terminal Colours." ~/.Xresources 2>/dev/null 1>/dev/null
[ "$?" -ne 0 ] && cat Xresources >> ~/.Xresources
set -e
curl -o ~/.vim/colors/hybrid.vim https://raw.githubusercontent.com/w0ng/vim-hybrid/master/colors/hybrid.vim
cp vimrc ~/.vimrc

# install plugins
vim +NeoBundleInstall +qall

# disable install YCM
# pushd ~/.vim/bundle/YouCompleteMe/
# ./install.py --clang-completer
# popd

# TAGLIST
cp -pR taglist/* ~/.vim/

