#!/bin/bash

dnf groupinstall -y "Development Tools" "Development Libraries" buildsys-build
dnf -y install kernel-devel-`uname -r`
dnf -y install libuuid libuuid-devel nasm flex bison texinfo
dnf -y install gmp  gmp-devel  mpfr  mpfr-devel  libmpc  libmpc-devel
