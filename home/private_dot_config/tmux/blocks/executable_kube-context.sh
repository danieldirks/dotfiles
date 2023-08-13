#!/bin/bash

if command -v kubectl &> /dev/null ; then
    KUBE_CONTEXT=$(kubectl config view --minify -o jsonpath='{.current-context}' 2> /dev/null)
    if [[ -n $KUBE_CONTEXT ]]; then
        echo -n "󱃾 $KUBE_CONTEXT "
    fi
fi

