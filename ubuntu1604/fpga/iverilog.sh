#!/bin/bash

sudo apt update && sudo apt install gperf flex bison -y

git clone https://github.com/steveicarus/iverilog.git iverilog
cd iverilog/
ls
sh autoconf.sh 
./configure 
make
make install

