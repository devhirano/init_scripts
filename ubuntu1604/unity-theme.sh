#!/bin/bash -x

pushd /tmp


### ICON ###
sudo wget -qO yosembiance.zip https://github.com/bsundman/Yosembiance/archive/master.zip
unzip -qo yosembiance.zip
sudo mv Yosembiance-master/Yosembiance-* /usr/share/themes/

# Papyrus
# https://github.com/PapirusDevelopmentTeam/papirus-icon-theme
sudo wget -qO- https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-icon-theme/master/install-papirus-root.sh | sh

# ARC theme
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/ /' >> /etc/apt/sources.list.d/arc-theme.list" && \
wget -q -O - http://download.opensuse.org/repositories/home:Horst3180/xUbuntu_16.04/Release.key | sudo apt-key add - && \
sudo apt update && sudo apt install arc-theme -y

# Flatabulous
# https://github.com/anmoljagetia/Flatabulous
sudo add-apt-repository -y ppa:noobslab/themes && \
sudo apt update && \
sudo apt -y install flatabulous-theme

### ICONS ###
# numix-icon-theme-circle
sudo -E add-apt-repository -y ppa:numix/ppa

# UltraFlat
sudo add-apt-repository -y ppa:noobslab/icons && \
sudo apt update && \
sudo apt -y install ultra-flat-icons

# Faenza
# sudo -E add-apt-repository -y ppa:tiheum/equinox

# Awoken
# sudo -E add-apt-repository -y ppa:alecive/antigone

# vibrancy-colors
sudo -E add-apt-repository -y ppa:ravefinity-project/ppa

# evolvere-icon-suite
# sudo -E add-apt-repository -y ppa:noobslab/evolvere


sudo apt-get update


sudo apt install -y \
        numix-icon-theme-circle \
        faenza-icon-theme \
        vibrancy-colors


popd

