#!/bin/bash

root=${PASSWORD_STORE_DIR:-$HOME/.password-store/}
cd $root

function get_password() {
    echo $(pass show $ROFI_DATA | head -n1)
}

function get_username() {
    echo $(pass show $1 | grep -E "login|username" | sed "s/^.*: //" | head -n1)
}

function get_otp() {
    echo $(pass otp $1)
}

function set_clipboard() {
    echo $1 | xclip -selection clipboard
    sleep 60 && xclip -selection clipboard < /dev/null &
}

if [ -n "$ROFI_DATA" ]; then
    killall rofi

    case "$1" in
        "Insert Password")
            xdotool type $(get_password $ROFI_DATA)
            ;;
        "Insert Username")
            xdotool type $(get_username $ROFI_DATA)
            ;;
        "Insert Username and Password")
            xdotool type $(get_username $ROFI_DATA)
            xdotool key Tab
            xdotool type $(get_password $ROFI_DATA)
            ;;
        "Insert OTP")
            xdotool type $(get_otp $ROFI_DATA)
            ;;
        "Copy Password")
            set_clipboard $(get_password $ROFI_DATA)
            ;;
        "Copy Username")
            set_clipboard $(get_username $ROFI_DATA)
            ;;
        "Copy OTP")
            set_clipboard $(get_otp $ROFI_DATA)
            ;;
        *)
            rofi -e "Nothing selected"
            ;;
    esac
    exit
fi

if [ -n "$1" ]; then
    echo -en "\0prompt\x1fAction\n"
    echo -en "\0data\x1f$@\n"
    echo "Insert Password"
    echo "Insert Username"
    echo "Insert Username and Password"
    echo "Insert OTP"
    echo "Copy Password"
    echo "Copy Username"
    echo "Copy OTP"
    exit
fi

find . -type f -not -path '*/.*' -name '*.gpg' | sed -e "s|^./||" -e "s|.gpg$||"
