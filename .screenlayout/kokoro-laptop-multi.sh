#!/bin/sh
xrandr --output eDP-1 --primary --mode 2880x1800 --pos 2560x0 --rotate normal --output HDMI-1 --mode 2560x1440 --pos 0x0 --rotate normal --output DP-1 --off --output DP-2 --off --output DP-3 --off --output DP-4 --off
feh --bg-fill "/home/kokoro/dotfiles/img/31A.png"
