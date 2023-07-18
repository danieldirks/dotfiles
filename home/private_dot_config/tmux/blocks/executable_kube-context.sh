#!/bin/bash

if command -v kubectl &> /dev/null ; then
    KUBE_CONTEXT=$(kubectl config view --minify -o jsonpath='{.current-context}' 2> /dev/null)
    if [[ -n $KUBE_CONTEXT ]]; then
        echo -ne "#[bg=${TMUX_COLOR_BLOCK},fg=${TMUX_COLOR_BLUE}]"
        echo -ne "#[bg=${TMUX_COLOR_BLUE},fg=${TMUX_COLOR_BACKGROUND}]󱃾 "
        echo -ne "#[bg=${TMUX_COLOR_BLOCK},fg=${TMUX_COLOR_TEXT}] $KUBE_CONTEXT "
    fi
fi

