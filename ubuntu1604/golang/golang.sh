#!/bin/bash

# https://golang.org/doc/install

pushd /tmp
sudo wget https://dl.google.com/go/go1.11.5.linux-amd64.tar.gz
sudo tar xf go1.11.5.linux-amd64.tar.gz -C /usr/local/

grep "/usr/local/go/bin" ~/.bashrc >/dev/null
if [ $? != 0 ];then
  mkdir -p ~/.go/{bin,pkg,src}
  echo 'export GOPATH=$HOME/.go' >> ~/.bashrc
  echo 'export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin' >> ~/.bashrc
  echo '' >> ~/.bashrc
fi
source ~/.bashrc
. ~/.bashrc

# check
go version

popd



