#!/bin/bash

pkill xwinwrap

sleep 1

v=$1
vo='vdpau'
xwinwrap -g ${SCREEN_X}x${SCREEN_Y} -ov -ni -s -nf -- mpv --vo=$vo --mute=yes --loop --wid WID $v &
