#!/bin/bash

pkill xwinwrap

sleep 0.2

#vid='Honkai-Impact-3-Live-Wallpaper-Free.mp4'
#vid='In-The-Snow-Anime-Girl-Live-Wallpaper.m4v'
vid='Miko-Fox-Anime-Live-Wallpaper.mp4'
#vid='Rainy-Evening-Anime-Girl-Live-Wallpaper.mp4'
#vid='Serenity-Anime-Girl-Landscape-Live-Wallpaper.mp4'
#vid='Space-Nebula-4k-Live-Wallpaper.mp4'

xwinwrap -g 2560x1440 -ov -ni -fs -s -st -sp -b -nf -- mpv --loop --wid WID ~/Wallpapers/vid/$vid
