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
dir_config=~/.config/wall/vid/
screen=screen_${DISPLAY//:}.conf
config="$dir_config$screen"
current=""
new=""

if [ ! -d "$dir_config" ]; then
	mkdir -p $dir_config
fi

if [ -f "$config" ]; then
	current=$(cat "$config")
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
	echo "$new" > $config
	echo Saved persistent: $config
	echo Setting wallpaper: $(basename "$new")
	~/.scripts/background/vidbg.sh
fi
