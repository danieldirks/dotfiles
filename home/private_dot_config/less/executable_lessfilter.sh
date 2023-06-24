#!/bin/bash

MIME=$(file -bL --mime-type "$1")   # e.g. image/jpeg
TYPE=${MIME%%/*}                    # e.g. image
EXT=${MIME##*/}                     # e.g. jpeg

if [ -d "$1" ]; then
    fd -d1 --color=always . "$1"
elif [ "$TYPE" = image ]; then
    zsh -c "source ~/.zshrc && catimg ${1}"
    exiftool "$1"
elif [ "$TYPE" = text ]; then
    bat --style=numbers --color=always "$1"
elif [ -f "$1" ]; then
    bat --color=always "$1"
else
    echo "$1"
fi
