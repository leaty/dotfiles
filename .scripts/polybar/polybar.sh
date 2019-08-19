#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait a bit
sleep 0.2

# Launch polybar
polybar top &
polybar top2 &
