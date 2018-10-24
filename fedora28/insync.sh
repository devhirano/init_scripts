#!/bin/bash

# https://www.insynchq.com/downloads

sudo rpm --import https://d2t3ff60b2tol4.cloudfront.net/repomd.xml.key

cat << EOT | sudo tee -a /etc/yum.repos.d/insync.repo
[insync]
name=insync repo
baseurl=http://yum.insynchq.com/fedora/$releasever/
gpgcheck=1
gpgkey=https://d2t3ff60b2tol4.cloudfront.net/repomd.xml.key
enabled=1
metadata_expire=120m
EOT

sudo yum install insync
