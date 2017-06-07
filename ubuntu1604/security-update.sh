#!/bin/bash 

PKGS="google-chrome-stable firefox"

# check pkgs
for i in $PKGS
do
  sudo dpkg -l |grep -e "^ii " |grep -e $i 1>/dev/null
  if [ $? -ne 0 ];then
	  echo "$i is not installed. ($PKGS)" ; exit 1
  fi
done


# update pkgs
sudo apt update
sudo apt -y install \
	$PKGS

if [ $? != 0 ];then
  for i in $PKGS
  do
    sudo apt -y install $i
  done
fi

