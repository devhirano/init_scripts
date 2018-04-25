#!/bin/bash

sudo apt-get update
sudo apt-get -y install git curl g++ make
sudo apt-get -y install zlib1g-dev libssl-dev libreadline-dev
sudo apt-get -y install libyaml-dev libxml2-dev libxslt-dev
sudo apt-get -y install sqlite3 libsqlite3-dev nodejs

rvm implode

git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

mkdir -p ~/.rbenv/plugins
cd ~/.rbenv/plugins
git clone git://github.com/sstephenson/ruby-build.git

RUBY_CONFIGURE_OPTS="--enable-shared" rbenv install 2.3.1
RUBY_CONFIGURE_OPTS="--enable-shared" rbenv global 2.3.1

# link if missing shared library
if [ -z "/usr/lib/x86_64-linux-gnu/libruby.so" ];then
  cd /usr/lib/x86_64-linux-gnu
  ln -s -f libruby-2.3.so.2.3.0 libruby.so
fi
