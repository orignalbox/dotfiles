#!/bin/sh

# A simpler, more reliable battery script.

# Get battery percentage and status
capacity=$(cat /sys/class/power_supply/BAT0/capacity)
status=$(cat /sys/class/power_supply/BAT0/status)

# Critical battery warning
if [ "$capacity" -le 15 ] && [ "$status" != "Charging" ]; then
    notify-send -u critical "Battery Low!" "$capacity% remaining"
fi

# Output for dwmblocks (percentage only)
echo "$capacity%"