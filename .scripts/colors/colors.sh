#!/bin/bash
~/.colors/build.sh

xrdb ~/.Xresources
for pid in $(pgrep urxvt); do kill -SIGHUP $pid; done
