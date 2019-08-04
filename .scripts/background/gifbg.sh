#!/bin/bash

pkill xwinwrap

sleep 0.2

#xwinwrap -g 2560x1440 -ov -ni -s -nf -- gifview -w WID ~/Wallpapers/gif/coffee_rain_walk.gif -a
xwinwrap -g 2560x1440 -ov -ni -s -nf -- gifview -w WID ~/Wallpapers/gif/pixels10.gif -a
