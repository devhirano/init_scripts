#!/bin/bash

mkdir -p /var/kvm/images 
virt-install \
--name www \
--ram 1024 \
--disk path=/var/lib/libvirt/images/www.img,size=10 \
--vcpus 1 \
--os-type linux \
--os-variant rhel6 \
--network network=default \
--graphics none \
--console pty,target_type=serial \
--location 'http://ftp.jaist.ac.jp/pub/Linux/CentOS/6/os/x86_64/' \
--extra-args 'console=ttyS0,115200n8 serial'
