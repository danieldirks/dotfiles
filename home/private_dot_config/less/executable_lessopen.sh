#!/bin/sh

MIME=$(file -bL --mime-type "$1")   # e.g. image/jpeg
TYPE=${MIME%%/*}                    # e.g. image
EXT=${MIME##*/}                     # e.g. jpeg

if [ -d "$1" ]; then
    fd -d1 --hidden --exclude .git --color=always . "$1"
elif [ "$TYPE" = image ]; then
    viu "$1"
    exiftool "$1"
elif [ "$TYPE" = text ]; then
    bat --style=numbers --color=always "$1"
else
    bat --color=always "$1"
fi
