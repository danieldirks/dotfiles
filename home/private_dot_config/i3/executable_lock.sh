#!/bin/bash

sleep .1
rm -f "$HOME/.cache/lock.png"

# make screenshot
scrot -z "$HOME/.cache/lock.png"

# blur and dim screenshot
magick "$HOME/.cache/lock.png" -scale 5% -scale 2000% -fill black -colorize 20% "$HOME/.cache/lock.png"

# add symbol to screenshot
#GEOMETRY=""
#if [ $((`DISPLAY=:0 xrandr -q | grep ' connected' | wc -l` % 2)) -eq 0 ]; then
#    GEOMETRY="-geometry +960"
#fi
#magick "$HOME/.cache/lock.png" "$HOME/.config/i3/lock.png" $GEOMETRY -gravity center -composite "$HOME/.cache/lock.png"

killall picom

# lock using i3lock
i3lock --no-unlock-indicator --nofork --image="$HOME/.cache/lock.png"

picom -b
