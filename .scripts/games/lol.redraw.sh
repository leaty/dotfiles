#!/bin/bash

# Get window and window size of league client
window=$(xdotool search -class leagueclientux.exe | tail -n1)
size=$(xdotool getwindowgeometry $window | tail -n1 | awk '{print $2}')
size_x=$(echo $size | awk -F'x' '{print $1}')
size_y=$(echo $size | awk -F'x' '{print $2}')

# Settings pos
open_pos_x=$(bc <<< $size_x*96/100)
open_pos_y=$(bc <<< $size_y*2/100)
close_pos_x=$(bc <<< $size_x*50/100)
close_pos_y=$(bc <<< $size_y*88/100)

# Open settings
xdotool mousemove --sync -w $window $open_pos_x $open_pos_y click 1

# If the client is too slow (never happened to me)
# sleep 0.5

# Close settings
xdotool mousemove --sync -w $window $close_pos_x $close_pos_y click 1
