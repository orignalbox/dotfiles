#!/bin/sh
device=$(ls /sys/class/backlight | head -n 1)  # Auto-detect backlight device
max=$(cat /sys/class/backlight/$device/max_brightness)
current=$(cat /sys/class/backlight/$device/brightness)
percent=$((current * 100 / max))

case $1 in
  "up")   xbacklight -inc 5 ;;
  "down") xbacklight -dec 5 ;;
  *)      echo "☀️ $percent%" ;;
esac

[ "$2" = "click" ] && notify-send "Brightness" "$percent% (Max: $max)"
