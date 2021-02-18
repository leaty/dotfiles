#!/bin/bash

# This script sets most of everything to black
# Used for playing windowed games in virtual desktop "without" borders
# It's not advanced enough to know if it's already been run
# CAUTION: changing wine configuration is near impossible after this
if [ -z "$1" ]; then
  echo "Missing wine prefix arg."
  exit 1
fi

prefix="$1"
blackout="$(dirname "$0")/blackout.theme"

cat "$blackout" >> "$1/user.reg"
