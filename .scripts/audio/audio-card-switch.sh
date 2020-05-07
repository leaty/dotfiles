#!/bin/sh
#profile1='output:iec958-stereo'
#profile2='output:analog-output-surround71+input:analog-input'

card1='alsa_card.pci-0000_0b_04.0'
card2='alsa_card.usb-Sennheiser_GSX_1200_Pro_Main_Audio_5698810059014188-00'

input='alsa_input.usb-Sennheiser_GSX_1200_Pro_Main_Audio_5698810059014188-00.analog-input'
sink1='alsa_output.pci-0000_0b_04.0.iec958-stereo'
sink2='alsa_output.usb-Sennheiser_GSX_1200_Pro_Main_Audio_5698810059014188-00.analog-output-surround71'
sink_current=$(pactl info | grep 'Default Sink' | awk '{print $3};')
sink_default=$sink1
sink_toggle=$sink_default

# Determine which sink to toggle
# Also toggle microphone
case $sink_current in
	"$sink1")
		echo "$sink1 --> $sink2"
		sink_toggle=$sink2
		pactl set-source-mute $input 0;;
	"$sink2")
		echo "$sink2 --> $sink1"
		sink_toggle=$sink1
		pactl set-source-mute $input 1;;
	*)
		echo "Unmatched, setting to $sink_default."
		pactl set-source-mute $input 1
esac

pactl set-default-sink $sink_toggle

for i in $(pacmd list-sink-inputs | grep index | awk '{print $2}')
	do pactl move-sink-input $i $sink_toggle
done
