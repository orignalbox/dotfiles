#!/bin/sh
vol=$(pamixer --get-volume)
[ "$(pamixer --get-mute)" = "true" ] && icon="🔇" || icon="🔊"

case $1 in
  "up")   pamixer -i 5 ;;
  "down") pamixer -d 5 ;;
  "mute") pamixer -t ;;
  *)      echo "$icon $vol%" ;;
esac

[ "$2" = "click" ] && pavucontrol &
