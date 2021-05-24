#!/bin/bash

set -x

INSTALL_VERSION="2.6.6"

sudo apt-get update
sudo apt-get -y install git curl g++ make
sudo apt-get -y install zlib1g-dev libssl-dev libreadline-dev
sudo apt-get -y install libyaml-dev libxml2-dev libxslt-dev
sudo apt-get -y install sqlite3 libsqlite3-dev nodejs

if [ ! -d "/home/vagrant/.rbenv" ]; then
    git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
fi

if [ ! grep rbenv ~/.bashrc ]; then
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc
    export PATH="$HOME/.rbenv/bin:$PATH"
    rbenv init -
fi

mkdir -p ~/.rbenv/plugins
cd ~/.rbenv/plugins
git clone git://github.com/sstephenson/ruby-build.git

RUBY_CONFIGURE_OPTS="--enable-shared" rbenv install $INSTALL_VERSION
rbenv global $INSTALL_VERSION

# link if missing shared library
# if [ -z "/usr/lib/x86_64-linux-gnu/libruby.so" ];then
#   cd /usr/lib/x86_64-linux-gnu
#   ln -s -f libruby-2.3.so.2.3.0 libruby.so
# fi
