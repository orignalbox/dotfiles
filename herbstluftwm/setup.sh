#!/bin/bash
hc() { herbstclient "$@"; }

# Set up tags (workspaces)
hc rename default "1" || true
for i in {1..9}; do
    hc add "$i"
done

# Window and frame settings
hc set auto_detect_monitors 1
hc set window_gap 5
hc set frame_gap 5
hc set smart_window_surroundings off

# Optional: Integrate with existing dotfiles
# Example: Load wal colors if you use wal
[ -f ~/.cache/wal/colors.sh ] && . ~/.cache/wal/colors.sh
