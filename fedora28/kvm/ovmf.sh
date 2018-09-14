#!/bin/bash

dnf install dnf-plugins-core
dnf config-manager --add-repo https://www.kernel.org/repos/firmware.repo
dnf install edk2-ovmf
