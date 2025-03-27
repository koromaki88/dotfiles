#!/bin/sh
# Toggle on/off an external HDMI monitor, does not support audio over HDMI as it's pretending that it's DVI

intern="eDP-1"
extern="HDMI-1"

case "$1" in
    "disconnect") xrandr --output "$extern" --off --output "$internet" --auto ;;
    "extra") xrandr --output "$extern" --mode 2560x1440 && xrandr --output "$intern" --auto --output "$extern" --left-of "$intern" ;;
esac
