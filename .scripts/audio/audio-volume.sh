#!/bin/sh

action=$1
card='alsa_output.pci-0000_0b_04.0'
#sink=$(pactl list sinks | grep "Name: $card." | awk '{print $2}')
sink=$(pactl info | grep 'Default Sink' | awk '{print $3};')

case $action in
	'up')
		echo "$sink +5%"
		pactl set-sink-volume $sink +5%;;
	'down')
		echo "$sink -5%"
		pactl set-sink-volume $sink -5%;;
	'mute')
		echo "$sink mute toggle"
		pactl set-sink-mute $sink toggle;;
	*)
		echo "up|down|mute";;
esac

