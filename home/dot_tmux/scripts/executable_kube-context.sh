#!/bin/sh

if command -v kubectl &> /dev/null ; then
    CONTEXT=$(kubectl config view --minify -o jsonpath='{.current-context}' 2> /dev/null)
    if [[ -n CONTEXT ]]; then
        echo " k8s:$CONTEXT "
    fi
fi
