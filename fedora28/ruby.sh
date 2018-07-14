#!/bin/bash

# https://developer.fedoraproject.org/start/sw/web-app/rails.html
dnf -y install git-core zlib zlib-devel gcc-c++ patch readline readline-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison curl sqlite-devel \
               gcc-6 gdbm-devel ncurses-devel

rvm implode

git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
# exec $SHELL
source ~/.bashrc

mkdir -p ~/.rbenv/plugins
cd ~/.rbenv/plugins
git clone git://github.com/sstephenson/ruby-build.git

# RUBY_CONFIGURE_OPTS="--enable-shared" rbenv install 2.3.1
# rbenv install 2.3.1
# RUBY_CONFIGURE_OPTS="--with-readline-dir=/usr/lib" CC=/usr/bin/gcc-6 rbenv install 2.3.1
rbenv install 2.5.1
rbenv global 2.5.1
rbenv rehash
