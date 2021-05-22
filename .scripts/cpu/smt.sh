#!/bin/bash

if [ -z $1 ] || [[ "$1" -ne 0 ]] && [[ "$1" -ne 1 ]]; then
	echo "1 = enable"
	echo "0 = disable"
	exit 1
fi

state=$1

for i in {1,3,5,7,9,11,13,15,17,19,21,23,25,27,29,31}; do
	sudo su root -c "echo $state > /sys/devices/system/cpu/cpu$i/online"
	echo "sudo su root -c echo $state > /sys/devices/system/cpu/cpu$i/online"
done
