#!/bin/bash

pkill xwinwrap

sleep 1

#vid='Honkai-Impact-3-Live-Wallpaper-Free.mp4'
#vid='In-The-Snow-Anime-Girl-Live-Wallpaper.m4v'
#vid='Miko-Fox-Anime-Live-Wallpaper.mp4'
#vid='Rainy-Evening-Anime-Girl-Live-Wallpaper.mp4'
#vid='Serenity-Anime-Girl-Landscape-Live-Wallpaper.mp4'
#vid='Space-Nebula-4k-Live-Wallpaper.mp4'
#vid='Sunset-Palm-Live-Wallpaper.mp4'
#vid='DesktopHut.com-Sunset-Series-Live-Wallpaper-Free.mp4'
#vid='Park-In-Winter-Snow-Live-Wallpaper.mp4'
#vid='Emerald-Pool-Live-Wallpaper-HD.mp4'
#vid='Bowl-and-Pitcher-Trail-Stream-Live-Wallpaper.m4v'
#vid='DesktopHut.com-Florest-Series-Live-Wallpaper-Free.mp4'
#vid='wolf_final.mp4'
#vid='anime-girl-in-water.mp4'
#vid='anime-girl-boat-bird.mp4'
#vid='anime-girl-clown.mp4'
#vid='4K-UHD-Flying-Above-Clouds-Live-Wallpaper.mp4'

#vid='Rainy-Evening-Anime-Girl-Live-Wallpaper.mp4'
#vid='Grace-Lamp-Anime-Live-Wallpaper.mp4'
#vid='Girl-With-Flute-In-Rain-Anime-Live-Wallpaper-Free.mp4'
#vid='Most-Beautiful-World-Hd-Live-Wallpaper.mp4'
#vid='Rainfall-Girl-Anime-Live-Wallpaper-Free.mp4'
#vid='Shoto-Todoroki-Boku-No-Hero-Academia-Anime-Live-Wallpaper.mp4'
#vid='Berserk-The-God-Hand-Live-Wallpaper.mp4'
#vid='Honkai-Impact-3-Live-Wallpaper-Free.mp4'
#vid='Touhou-Project-Anime-Live-Wallpaper.mp4'
#vid='Touhou-Onozuka-Komachi-Live-Wallpaper-Free.mp4'
#vid='Touhou-Fox-Girl-Anime-Live-Wallpaper-HD.m4v'
#vid='winter-wolf.mp4'
vid='In-The-Snow-Anime-Girl-Live-Wallpaper.m4v'


#xwinwrap -g 1920x1080+1920+0 -ov -ni -fs -s -st -sp -b -nf -- mpv --mute=yes --loop --wid WID ~/cloud/wall/vid/$vid

vo='vdpau'
xwinwrap -g 1920x1080 -ov -ni -s -nf -- mpv --vo=$vo --mute=yes --loop --wid WID ~/cloud/wall/vid/$vid &
xwinwrap -g 1920x1080+1920+0 -ov -ni -s -nf -- mpv --vo=$vo --mute=yes --loop --wid WID ~/cloud/wall/vid/$vid &
