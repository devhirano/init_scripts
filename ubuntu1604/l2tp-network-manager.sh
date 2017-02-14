#!/bin/bash

sudo apt update
sudo apt install -y git intltool libtool libnm-glib-vpn-dev libnm-gtk-dev libnm-dev libsecret-1-dev libgtk-3-dev libglib2.0-dev libnma-dev ppp-dev libdbus-glib-1-dev network-manager-dev libnm-util-dev libnm-glib-dev xl2tpd strongswan dh-autoreconf intltool


git clone https://github.com/nm-l2tp/network-manager-l2tp.git ~/.network-manager-l2tp
pushd ~/.network-manager-l2tp

sudo ./autogen.sh
sudo ./configure --prefix=/usr \
--sysconfdir=/etc --localstatedir=/var \
--libdir=/usr/lib/x86_64-linux-gnu --libexecdir=/usr/lib/x86_64-linux-gnu \
--with-pppd-plugin-dir=/usr/lib/pppd/2.4.7 --enable-absolute-paths

sudo make && sudo make install
sudo update-rc.d -f xl2tpd remove

popd

