#!/bin/sh
export HOME=/home/chadkouse
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

export XDG_CONFIG_HOME=$HOME/.config
export _JAVA_AWT_WM_NONREPARENTING=1

# xrandr --setprovideroutputsource modesetting NVIDIA-0
# xrandr --auto

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

# bind keys
sxhkd &

# set keyboard repeat delay / rate
xset r rate 200 45

if [ -x /usr/bin/gcalcli ]; then
  while true; do
    /usr/bin/gcalcli remind
    sleep 300
  done &
fi

# xrandr --output DisplayPort-0 --auto --left-of HDMI-A-0
# xrandr --output HDMI-A-0 --auto --rotate right
# xrandr --output DP-0.1 --left-of eDP-1-1 --auto
# autorandr -c
# autorandr --load mobile --force

# setxkbmap us -variant colemak
# setxkbmap -option caps:swapescape

sleep 10 && clipmenud&

# exec i3
exec dwm
# exec bspwm
# exec xterm
