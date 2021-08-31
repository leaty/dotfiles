#!/bin/bash

# Start corefreqd if not running
if ! systemctl --quiet is-active corefreqd; then
	sudo modprobe corefreqk
	sudo systemctl start corefreqd
fi

corefreq-cli -OE 2 -t

# watch -n0.5 'sensors | grep -e Tc -e Td'
