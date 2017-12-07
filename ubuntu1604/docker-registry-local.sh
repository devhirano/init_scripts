#!/bin/bash

sudo docker pull registry
sudo mkdir -p /opt/docker/volumes/registry
sudo docker run -d -p 5000:5000 -v /opt/docker/volumes/registry:/var/lib/registry --name reg registry


