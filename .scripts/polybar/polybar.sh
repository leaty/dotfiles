#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait a maximum of ~5 seconds for polybar to close
# Might become higher depending on pgrep speed
max=$(bc <<< 5/0.01)
while pgrep -x polybar > /dev/null; do
  sleep 0.01
  let count++
  if [ "$count" -ge "$max" ]; then
    echo "Reached max; terminating."
    exit 1
  fi
done

# Launch polybar
MONITOR=$MONITOR1 polybar top &
#MONITOR=$MONITOR2 polybar top2 &
