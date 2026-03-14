#!/bin/sh

# Force Dark Theme System-wide
# set icon theme for tray icons
export GTK_ICON_THEME=Papirus-Dark
export GTK_THEME=Adwaita-dark
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export QT_QPA_PLATFORMTHEME=gtk3
dunst &
xiccd &
picom --config ~/dotfiles/picom/picom.conf -b &
feh --bg-scale ~/dotfiles/wal/img1.png &
nm-applet &
blueman-applet &
sxhkd &
xrandr --output eDP1 --gamma 0.9:0.9:0.9

~/dotfiles/dwmblocks/dwmblocks &
clipmenud &
exec dwm
