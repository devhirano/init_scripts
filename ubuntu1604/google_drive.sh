#!/bin/bash

sudo add-apt-repository -y ppa:alessandro-strada/ppa
sudo apt update
sudo apt install -y google-drive-ocamlfuse

mkdir -p ~/googledrive

# get auth token
google-drive-ocamlfuse

# mount
df ~/googledrive |grep google-drive-ocamlfuse >/dev/null
if [ $? != 0 ];then
  google-drive-ocamlfuse ~/googledrive
fi

# umount
# fusermount -u ~/googledrive

