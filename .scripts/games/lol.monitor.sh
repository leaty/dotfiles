#!/bin/bash

game="league of legends.exe"
client=leagueclientux.exe
after=',"old":{'

# Monitors switching to any workspace which holds the league client
# Then runs lol.redraw.sh
i3-msg -t subscribe -m '[ "workspace" ]' \
	| while read -r event; do \
		if echo $event | grep -v "$game" | grep -o "$client.*" | grep -q "$after"; then \
			~/.scripts/games/lol.redraw.sh; \
		fi \
	done
