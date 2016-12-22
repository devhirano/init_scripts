#!/bin/bash

sudo apt update
sudo apt -y install apt-transport-https ca-certificates
sudo apt-key adv \
               --keyserver hkp://ha.pool.sks-keyservers.net:80 \
               --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

grep ubuntu-xenial /etc/apt/sources.list.d/docker.list 1>/dev/null
if [ $? != 0 ]; then
  echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | sudo tee /etc/apt/sources.list.d/docker.list
fi

sudo apt update
sudo apt-cache policy docker-engine
sudo apt -y install linux-image-extra-$(uname -r) linux-image-extra-virtual

sudo apt -y install docker-engine

sudo service docker restart
sudo docker run hello-world

