#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

if [ -f /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 ]; then
	exec /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
fi

# start Gnome keyring
#if [ -f /usr/bin/gnome-keyring-daemon ]; then
#	dbus-update-activation-environment --systemd DISPLAY
#	eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
#	export SSH_AUTH_SOCK
#	sleep 0.5
#fi

# environment variables
#export LD_PRELOAD="/usr/lib/libgio-2.0.so.0 /usr/lib/libglib-2.0.so.0"

# nextcloud
/usr/bin/nextcloud &

# nm-applet
# Don't need anymore cuz no wifi
#/usr/bin/nm-applet &

# Set kb repeat
xset r rate 200 35

# load Xresources
xrdb /home/leaty/.Xresources

# Load pywal
wal -R

# Set keyboard
setxkbmap -layout se
xset r rate 200 35

# Set up displays
#~/.scripts/xorg/xrandr.sh

# start i3
if [ -f /usr/bin/i3 ]; then
	exec i3
fi

# start awesome
#if [ -f /usr/bin/awesome ]; then
#	exec awesome >> ~/.local/log/awesomewm.log 2>&1
#fi

