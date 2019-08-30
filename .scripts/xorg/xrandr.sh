#!/bin/bash
xrandr | grep 'HDMI-1-2 connected' && xrandr | grep 'DP-1-1 connected' &&
	xrandr --output HDMI-1-2 --auto --primary --output DP-1-1 --auto --right-of HDMI-1-2 --output eDP-1-1 --auto --right-of DP-1-1

if xrandr | grep "HDMI-1-2 connected" && xrandr | grep "DP-1-1 connected"
then
	xrandr --output HDMI-1-2 --auto --primary --output DP-1-1 --auto --right-of HDMI-1-2 --output eDP-1-1 --off
else
	xrandr --output eDP-1-1 --auto --primary
fi
