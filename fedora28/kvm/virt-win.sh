#!/bin/bash

wget https://fedorapeople.org/groups/virt/virtio-win/virtio-win.repo -O /etc/yum.repos.d/virtio-win.repo
dnf install virtio-win
dnf --enablerepo=virtio-win-latest upgrade virtio-win

find /usr/share/virtio-win/*.iso

