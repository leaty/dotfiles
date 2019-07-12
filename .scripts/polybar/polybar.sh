#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait a bit
sleep 0.1

# Launch polybar
polybar top &
