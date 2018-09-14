#!/bin/bash

dnf groupinstall -y "Development Tools" "Development Libraries"
dnf -y install kernel-devel-`uname -r`
dnf -y install libuuid libuuid-devel
dnf -y install nasm
dnf -y install flex
