#!/bin/bash

mkdir -p /var/kvm/images 
virt-install \
--name tinycore \
--ram 32 \
--disk none \
--vcpus 1 \
--livecd \
--network network=default \
--graphics vnc \
--cdrom './iso/TinyCore-current.iso'
