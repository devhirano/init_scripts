#!/bin/bash -x

DISPLAY_NAME=$(xrandr -q | grep " connected" |awk '{print $1}')
xrandr --output ${DISPLAY_NAME} --rotate normal
