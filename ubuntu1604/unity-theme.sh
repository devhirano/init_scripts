#!/bin/bash

pushd /tmp


### ICON ###
sudo wget -qO yosembiance.zip https://github.com/bsundman/Yosembiance/archive/master.zip
unzip -qo yosembiance.zip
sudo mv Yosembiance-master/Yosembiance-* /usr/share/themes/

# Papyrus
# https://github.com/PapirusDevelopmentTeam/papirus-icon-theme
sudo wget -qO- https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-icon-theme/master/install-papirus-root.sh | sh


popd

