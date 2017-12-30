#!/bin/bash

sudo apt install -y gcc g++ make openssl libssl-dev libbz2-dev libreadline-dev libsqlite3-dev

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

env PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install -f 3.5.1
pyenv rehash
pyenv global 3.5.1

pip install --upgrade pip

