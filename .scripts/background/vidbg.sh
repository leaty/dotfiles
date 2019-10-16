#!/bin/bash

# Read default config
o='xv'
d=~/cloud/wall/vid
a=(
	'In-The-Snow-Anime-Girl-Live-Wallpaper.m4v'
)

# Read user config
if [ -n "$1" ]; then 
	source $1
fi

# Kill previous instances
pkill xwinwrap
sleep 1

# Start new instances
x=0
for v in ${a[@]}; do
	xwinwrap -g ${SCREEN_X}x${SCREEN_Y}+$x+0 -ov -ni -s -nf -- mpv --vo=$o --no-audio --loop --wid WID $d/$v &
	x=$((xpos+${SCREEN_X}));
done

