#!/bin/bash

yum install -y qemu-kvm virt-manager virt-install

if [ ! -f "/etc/modprobe.d/qemu-system-x86.conf" ]; then
  echo "options kvm_intel nested=1" /etc/modprobe.d/qemu-system-x86.conf
fi
