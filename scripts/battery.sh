#!/bin/sh
capacity=$(cat /sys/class/power_supply/BAT0/capacity)
status=$(cat /sys/class/power_supply/BAT0/status)

[ "$status" = "Charging" ] && icon="⚡" || icon="🔋"

# Critical battery warning
[ "$capacity" -le 10 ] && [ "$status" != "Charging" ] && \
  notify-send -u critical "Battery Low!" "$capacity% remaining"

[ "$1" = "click" ] && notify-send "Battery" "$(acpi -b)" && exit

echo "$icon $capacity%"
