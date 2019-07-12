#!/bin/bash
scheme=~/.colors/schemes/leaty/live.yaml
colors=(
	base00
	base01
	base02
	base03
	base04
	base05
	base06
	base07
	base08
	base09
	base0A
	base0B
	base0C
	base0D
	base0E
	base0F
)


rm -f $scheme
echo 'scheme: "Random"' >> $scheme
echo 'author: "leaty"' >> $scheme

while true
do
	for c in ${colors[@]}
	do
		if [[ $c == base05 ]]; then
			echo "$c: \"ffffff\"" >> $scheme
			continue
		fi
		echo "$c: \"$(openssl rand -hex 3)\"" >> $scheme
	done

	~/.config/i3/colors.sh > /dev/null 2>1&
	#~/.colors/test.sh
	sleep 2
done
