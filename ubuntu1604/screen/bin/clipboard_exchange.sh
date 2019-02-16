#!/bin/bash

ACTION=$1

if [ "$ACTION" = "screen-to-x" ];then
  screen -X writebuf && xsel -bi < $HOME/.screen-exchange && screen -X echo "copy to clipboard!"

elif [ "$ACTION" = "x-to-screen" ];then
  xsel -bo > $HOME/.screen-exchange && screen -X readbuf && screen -X echo "copy to buffer!"

fi
