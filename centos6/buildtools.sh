#!/bin/bash

yum -y groupinstall 'Development Tools'
yum -y install \
         gcc make libcurl-devel openssl-devel gmp-devel tar libffi-devel gettext-devel \
         glib2-devel fuse fuse-devel \
         automake rpm-build redhat-rpm-config \
         yum-utils

mkdir -p ~/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS}
echo '%_topdir %(echo $HOME)/rpmbuild' > ~/.rpmmacros

