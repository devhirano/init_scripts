#!/bin/bash

ACTION=$1

if [ "$ACTION" = "screen-to-x" ];then
    screen -X writebuf && \
        sync && \
        xsel -bi < $HOME/.screen-exchange && \
        screen -X echo "copy to clipboard! : $(xsel -bo | head -n 1)"

elif [ "$ACTION" = "x-to-screen" ];then
    sync && \
        xsel -bo > $HOME/.screen-exchange && \
        screen -X readbuf && \
        screen -X echo "copy to buffer! : $(head -n 1 $HOME/.screen-exchange)"

elif [ "$ACTION" = "check-buffer" ];then
    screen -X bufferfile $HOME/.screen-exchange-tmp
    echo
    echo "  #### [ screen copy/paste buffer | head -n 10 ]"
    screen -X writebuf && sync
    cat $HOME/.screen-exchange-tmp | head -n 10 | sed -e "s/^/  #### /g"
    echo
    echo "  #### [ X clipboard buffer | head -n 10 ]"
    xsel -bo | head -n 10 | sed -e "s/^/  #### /g"
    echo
    screen -X bufferfile $HOME/.screen-exchange
fi
