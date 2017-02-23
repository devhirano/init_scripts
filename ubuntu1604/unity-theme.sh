#!/bin/bash

pushd /tmp


### ICON ###
sudo wget -qO yosembiance.zip https://github.com/bsundman/Yosembiance/archive/master.zip
unzip -qo yosembiance.zip
sudo mv Yosembiance-master/Yosembiance-* /usr/share/themes/

# Papyrus
# https://github.com/PapirusDevelopmentTeam/papirus-icon-theme
sudo wget -qO- https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-icon-theme/master/install-papirus-root.sh | sh

### ICONS ###
# numix-icon-theme-circle
sudo -E add-apt-repository -y ppa:numix/ppa

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

