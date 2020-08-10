#!/bin/bash

if [ -z "$1" ]; then
	echo 'Missing dir argument.'
	exit 1
fi

dir=$1
vo='vdpau'

for f in $(find $dir -type f -printf "%T@ %p\n" | sort -nr | awk '{sub($1 OFS, ""); print $0}')
do
	echo "$f"
	pkill -9 xwinwrap
	pkill mpv
	sleep 0.2
	xwinwrap -g 1920x1080 -ov -ni -s -nf -- mpv --vo=$vo --no-audio --loop -wid WID "$f" &
	sleep 5
done



