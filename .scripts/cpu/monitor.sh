#!/bin/bash

~/.scripts/urxvt/exec watch -n1 sudo cpupower monitor &
watch -n0.5 'sensors | grep -e Tc -e Td'
