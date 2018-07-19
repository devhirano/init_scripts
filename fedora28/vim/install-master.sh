#!/bin/bash

dnf -y install ncurses ncurses-dev lua-devel && \
    TEMP=$(mktemp -d) && \
    git clone https://github.com/vim/vim $TEMP/vim && \
    pushd $TEMP/vim && \
    ./configure --with-features=huge --enable-multibyte \
    --enable-luainterp=dynamic --enable-gpm \
    --enable-cscope --enable-fontset --enable-fail-if-missing \
    --prefix=/usr/local \
    --enable-python3interp=dynamic --enable-rubyinterp=dynamic && \
    make && \
    make install
