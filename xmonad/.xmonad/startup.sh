#!/bin/sh

# Wallpaper
if [ -z "$(pgrep nitrogen)" ] ; then
    nitrogen --restore &
fi

# compton
if [ -z "$(pgrep compton)" ] ; then
    compton -b &
fi

# xbacklight
if [ -z "$(pgrep xbacklight)" ] ; then
    xbacklight -set 70% &
fi



