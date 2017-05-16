#!/bin/bash

sudo apt install -y ubuntu-make qemu-kvm libmtp-dev mtpfs

sudo add-apt-repository -y ppa:ubuntu-desktop/ubuntu-make
# umake android android-studio
umake android

# run studio.sh
# /android/android-studio/bin/studio.sh &

# write udev rule for android devices
# lsusb


# $ lsusb 
# Bus 002 Device 006: ID 18d1:4ee7 Google Inc.  <<== this one in my env
# Bus 002 Device 002: ID 8087:0020 Intel Corp. Integrated Rate Matching Hub
# Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
# ...
# $ 
#
# write udev rule to /lib/udev/rules.d/69-libmtp.rules
# 
# # OnePlus3T
# ATTR{idVendor}=="18d1", ATTR{idProduct}=="4ee7", SYMLINK+="libmtp-%k", MODE="660", GROUP="audio", ENV{ID_MTP_DEVICE}="1", ENV{ID_MEDIA_PLAYER}="1", TAG+="uaccess"
# 
# Reconnect usb android device and allow pop-up on the device
# Thats it!
#



