#!/bin/bash

sudo dnf install zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel xz xz-devel

git clone -q https://github.com/yyuu/pyenv.git ~/.pyenv
git clone -q https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv

grep PYENV_ROOT ~/.bashrc >/dev/null
if [ $? != 0 ];then
cat << 'EOT' >> ~/.bashrc

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

EOT
fi

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# if you have no resources, set MAKEOPTS like following
# export MAKEOPTS="-j 1 -l 2.5"

CONFIGURE_OPTS="--enable-shared" CFLAGS=-I/usr/include/openssl pyenv install -f 3.5.3
CONFIGURE_OPTS="--enable-shared" CFLAGS=-I/usr/include/openssl pyenv install -f 2.7.15

pyenv rehash
pyenv global 2.7.15 3.5.3

pip install --upgrade pip

