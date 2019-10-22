#!/bin/bash

pkill -f 'compton -b'

sleep 0.1

compton -b --config ~/.config/compton.focus.conf


