#!/bin/bash
IFS=$'\n'

if [ -z "$1" ]; then
	echo 'No background given.'
	echo 'To calculate background from video use "0".'
	exit 1
fi
if [ -z "$2" ]; then
	echo 'No opacity given.'
	exit 1
fi
if [ -z "$3" ]; then
	echo 'No video(s) given.'
	exit 1
fi

#$2=65
#$3=313842

background=$1; shift
opacity=$1; shift
video="$@"

image=$(mktemp -u /tmp/vid2color.XXXXXXX.png)
~/.scripts/colors/vid2img.sh "$video" "$image" > /dev/null 2>&1

if [ $background == 0 ]; then
	wal -ni "$image" -a $opacity > /dev/null 2>&1
else
	wal -ni "$image" -a $opacity -b $background > /dev/null 2>&1
fi

rm "$image"

