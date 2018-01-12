#!/bin/bash

sudo apt update && \
sudo apt -y install make gcc libtime-hires-perl

wget https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/byte-unixbench/UnixBench5.1.3.tgz
tar zxvf UnixBench5.1.3.tgz
cd ./Unixbench
make

