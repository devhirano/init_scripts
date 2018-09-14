#!/bin/bash

DI=$(mktemp -d)
pushd $DI
wget https://acpica.org/sites/acpica/files/acpica-unix-20180629.tar.gz
tar zxvf acpica-unix-20180629.tar.gz
cd acpica-unix-20180629
make clean
make
make install
popd
rm -rf $DI
