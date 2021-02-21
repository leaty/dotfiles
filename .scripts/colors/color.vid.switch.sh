#!/bin/bash
IFS=$'\n'

if [ -z "$1" ]; then
	echo 'Missing dir argument.'
	exit 1
fi

if [ -z "$2" ]; then
	echo 'Missing direction argument (next/prev).'
	exit 1
fi

dir=$1
direction=$2
dir_config=~/.config/color/
config_video="${dir_config}color.vid.current"
config_opacity="${dir_config}color.vid.opacity.conf"
config_saturation="${dir_config}color.vid.saturation.conf"
config_background="${dir_config}color.vid.background.conf"

# Defaults
opacity=65
saturation=2.0
background=313842
current=""
new=""

if [ ! -d "$dir_config" ]; then
	mkdir -p $dir_config
fi

# User config
if [ -f "$config_video" ]; then
	current=$(cat "$config_video")
fi
if [ -f "$config_opacity" ]; then
	opacity=$(cat "$config_opacity")
fi
if [ -f "$config_saturation" ]; then
	saturation=$(cat "$config_saturation")
fi
if [ -f "$config_background" ]; then
	background=$(cat "$config_background")
fi

videos=$(find $dir -type f -printf "%T@ %p\n" | sort -nr | awk '{sub($1 OFS, ""); print $0}')
for f in $videos; do
	if [ -z "$current" ]; then
		new=$f
		break
	fi

	if [ "$direction" == "next" ]; then
		if [ "$prev" == "$current" ]; then
			new=$f
			break
		fi
	fi

	if [ "$direction" == "prev" ]; then
		if [ "$f" == "$current" ]; then
			new=$prev
			break
		fi
	fi

	prev=$f
done

if [ ! -z "$new" ]; then
	echo "$new" > $config_video
	echo "$opacity" > $config_opacity
	echo "$saturation" > $config_saturation
	echo "$background" > $config_background
	echo Saved persistent.
	echo - video: $config_video
	echo - opacity: $config_opacity
	echo - saturation: $config_saturation
	echo - background: $config_background
	echo Applying color using: $(basename "$new")
	~/.scripts/colors/vid2color.sh $background $saturation $opacity "$new"
fi
