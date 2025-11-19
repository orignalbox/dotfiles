#!/bin/sh
[ "$(bluetoothctl show | grep Powered | awk '{print $2}')" = "yes" ] && icon="" || icon=""

case $1 in
  "toggle") 
    if [ "$icon" = "" ]; then
      bluetoothctl power on
    else
      bluetoothctl power off
    fi ;;
  *) echo "$icon" ;;
esac

[ "$2" = "click" ] && blueman-manager &
