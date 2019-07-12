#!/bin/bash

while true
do
	for f in Wallpapers/gif/*.gif
	do
		if [[ $f == *pixel* ]]; then
			continue
		fi

		pkill xwinwrap
		sleep 0.2
		xwinwrap -g 2560x1440 -ov -ni -s -nf -- gifview -w WID $f -a &
		sleep 5
	done
done
