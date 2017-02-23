#!/bin/bash

sudo -E add-apt-repository -y ppa:udisks-indicator-team/ppa
sudo apt update
sudo apt install -y udisks-indicator
