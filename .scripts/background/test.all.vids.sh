#!/bin/bash

if [ -z "$1" ]; then
	echo 'Missing dir argument.'
	exit 1
fi

dir=$1
vo='vdpau'

for f in $dir/*
do
	echo "$f"
	pkill -9 xwinwrap
	pkill mpv
	sleep 0.2
	xwinwrap -g 1920x1080 -ov -ni -s -nf -- mpv --vo=$vo --mute=yes --loop --wid WID "$f" &
	xwinwrap -g 1920x1080+1920+0 -ov -ni -s -nf -- mpv --vo=$vo --mute=yes --loop --wid WID "$f" &
	sleep 5
done
