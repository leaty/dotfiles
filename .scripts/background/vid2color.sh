#!/bin/bash
if [ -z "$1" ]; then
	echo 'No video given.'
	exit 1
fi
if [ -z "$2" ]; then
	echo 'No opacity given.'
	exit 1
fi

vid=$1
img=/tmp/$(basename $1).png

opacity=$2

~/.scripts/background/vid2img.sh $vid $img

if [ -z "$3" ]; then
	echo 'No background given, taking from image'
	wal -ni $img -a $opacity #-b 313842
else
	wal -ni $img -a $opacity -b $3
fi

rm $img

