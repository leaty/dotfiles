#!/bin/sh
card='alsa_card.pci-0000_0b_04.0'
profile1='output:iec958-stereo'
profile2='output:analog-stereo+input:analog-stereo'
profile_current=$(pacmd list-cards | awk '/name:/ {print $2} /active profile:/ {print $3};' | sed -n '/alsa_card.pci-0000_0b_04.0/{n;p;}')

case $profile_current in
	"<$profile1>")
		echo "$profile1 --> $profile2"
		pactl set-card-profile $card $profile2;;
	"<$profile2>")
		echo "$profile2 --> $profile1"
		pactl set-card-profile $card $profile1;;
	*)
		echo "Unmatched, setting to $profile1."
		pactl set-card-profile $card $profile1;;
esac

