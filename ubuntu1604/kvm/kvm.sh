#!/bin/bash

sudo apt update

sudo apt -y install qemu-kvm libvirt-bin virtinst bridge-utils libosinfo-bin libguestfs-tools virt-top

sudo modprobe vhost_net
sudo cat /etc/modules | grep vhost_net || sudo sh -c 'echo "vhost_net" >> /etc/modules'


