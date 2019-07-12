#!/bin/bash

for c in ~/.colors/schemes/*.yaml ~/.colors/schemes/**/*.yaml
do
	if [[ $c == *"*"* ]]; then
		continue
	fi
	echo $c
	cp $c ~/.colors/schemes/leaty/live.yaml
	~/.config/i3/colors.sh
	sleep 5
done