#!/bin/bash

sudo apt-key adv --fetch-keys http://repos.codelite.org/CodeLite.asc
sudo apt-add-repository -y 'deb https://repos.codelite.org/ubuntu/ xenial universe'
sudo apt-get update
sudo apt-get install -y codelite wxcrafter


# apt-cache madison codelite
# sudo apt-get install codelite=9.1*

