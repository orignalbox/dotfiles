#!/bin/sh

# Get the necessary values from the /sys filesystem
current_capacity=$(cat /sys/class/power_supply/BAT0/capacity)
energy_full=$(cat /sys/class/power_supply/BAT0/energy_full)
energy_full_design=$(cat /sys/class/power_supply/BAT0/energy_full_design)
status=$(cat /sys/class/power_supply/BAT0/status)

# Use awk for floating point arithmetic to calculate the adjusted capacity
# This is: (current_charge / 100) * (current_max_capacity / original_design_capacity) * 100
# which simplifies to: current_charge * (current_max_capacity / original_design_capacity)
adjusted_capacity=$(awk "BEGIN {printf \"%.0f\", ${current_capacity} * ${energy_full} / ${energy_full_design}}")

# Set icon based on charging status
[ "$status" = "Charging" ] && icon="⚡" || icon="🔋"

# Critical battery warning (based on the *real* capacity)
[ "$current_capacity" -le 10 ] && [ "$status" != "Charging" ] && \
  notify-send -u critical "Battery Low!" "$current_capacity% remaining"

# Handle click action
[ "$1" = "click" ] && notify-send "Battery" "$(acpi -b)" && exit

# Echo the final, adjusted status
echo "$icon $adjusted_capacity%"