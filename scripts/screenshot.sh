#!/bin/bash

# Create screenshots directory if it doesn't exist
mkdir -p ~/screenshots

case "$1" in
    full)
        scrot ~/screenshots/%Y-%m-%d-%H%M%S_full.png -e 'xclip -selection clipboard -t image/png -i $f'
        ;;
    window)
        scrot -s ~/screenshots/%Y-%m-%d-%H%M%S_window.png -e 'xclip -selection clipboard -t image/png -i $f'
        ;;
    select)
        scrot -s ~/screenshots/%Y-%m-%d-%H%M%S_select.png -e 'xclip -selection clipboard -t image/png -i $f'
        ;;
esac
