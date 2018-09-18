#!/bin/bash

set -x

apt update && apt -y install xorg-dev

pushd $(mktemp -d)
wget -O tcl8.6.8.tgz https://downloads.sourceforge.net/project/tcl/Tcl/8.6.8/tcl8.6.8-src.tar.gz
tar zxvf tcl8.6.8.tgz
cd tcl8.6.8/unix
./configure && make && make install

wget -O tk8.6.8.tgz https://downloads.sourceforge.net/project/tcl/Tcl/8.6.8/tk8.6.8-src.tar.gz
tar zxvf tk8.6.8.tgz
cd tk8.6.8/unix
./configure && make && make install
