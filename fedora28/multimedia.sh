#!/bin/bash

# https://rpmfusion.org/Configuration

sudo rpm -ivh https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-28.noarch.rpm
sudo rpm -ivh https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-28.noarch.rpm

# install gstreamer
sudo dnf -y install gstreamer-plugins-base gstreamer1-plugins-base gstreamer-plugins-bad gstreamer-plugins-ugly gstreamer1-plugins-ugly gstreamer-plugins-good-extras gstreamer1-plugins-good-extras gstreamer1-plugins-bad-freeworld ffmpeg gstreamer-ffmpeg

# install vlc
sudo dnf -y install vlc
