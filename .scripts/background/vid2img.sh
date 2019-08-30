#!/bin/bash

if [ -z "$1" ]; then
	echo "No video given."
	exit 1
fi

if [ -z "$2" ]; then
	echo "No destination image given."
	exit 1
fi

vid=$1
img=$2

ffmpeg -ss 00:02 -i $vid -frames:v 1 $img
