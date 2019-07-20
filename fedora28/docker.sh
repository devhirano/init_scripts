#!/bin/bash

set -x

sudo rpm -qa |grep dnf-plugins-core
if [ "$?" -ne 0 ]; then
  sudo dnf -y install dnf-plugins-core
fi

sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

sudo dnf -y install docker-ce docker-ce-cli containerd.io

sudo systemctl enable docker

# docker compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
