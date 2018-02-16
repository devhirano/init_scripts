#!/bin/bash

sudo apt update && \
sudo apt install -y linux-tools-common linux-tools-$(uname -r)

