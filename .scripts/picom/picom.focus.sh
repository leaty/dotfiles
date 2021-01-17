#!/bin/bash

pkill -f 'picom -b'

sleep 0.1

picom -b --experimental-backends --config ~/.config/picom/picom.focus.conf


