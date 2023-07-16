#!usr/bin/bash
# xrandr for lightdm and anything else
user=$(whoami)
if [[ "$user" == "lightdm" ]]; then
   xrandr --output DP-1 --primary --mode 2560x1440 --refresh 143.91 --pos 1366x0 --rotate normal --scale 0.85x0.85 --output HDMI-1 --off --output DP-2 --mode 1366x768 --refresh 59.79 --pos 0x228 --rotate normal --scale 1x1 --output HDMI-2 --off --output DP-3 --off --output HDMI-3 --off
else
   xrandr --output DP-1 --primary --mode 2560x1440 --refresh 143.91 --pos 1366x0 --rotate normal --scale 0.85x0.85\
          --output HDMI-1 --off\
          --output DP-2 --mode 1366x768 --refresh 59.79 --pos 0x228 --rotate normal --scale 1x1\
          --output HDMI-2 --off\
          --output DP-3 --off\
          --output HDMI-3 --off
fi
