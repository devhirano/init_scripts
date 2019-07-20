#!/bin/bash

set -x

sudo rpm -qa |grep dnf-plugins-core
if [ "$?" -ne 0 ]; then
  sudo dnf -y install dnf-plugins-core
fi

sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

sudo dnf -y install docker-ce docker-ce-cli containerd.io

sudo systemctl enable docker
