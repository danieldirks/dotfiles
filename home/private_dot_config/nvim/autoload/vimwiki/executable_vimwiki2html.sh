#!/bin/bash

FORCE="$1"
SYNTAX="$2"
EXTENSION="$3"
OUTPUTDIR="$4"
INPUT="$5"
CSSFILE="$6"
TEMPLATE_PATH="$7"
TEMPLATE_NAME="$8"
TEMPLATE_EXT="$9"

[[ "$SYNTAX" == "markdown" ]] || { echo "Error: Unsupported syntax"; exit 2; };

OUTPUT="$OUTPUTDIR$(basename "$INPUT" ."$EXTENSION").html"
TEMPLATE="$TEMPLATE_PATH$TEMPLATE_NAME$TEMPLATE_EXT"

if [ ! -z $(grep -o "\$\$.\+\$\$" "$INPUT") ]; then
    MATH="--mathjax=https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"
else
    MATH=""
fi

cat "$INPUT" | sed -r "s|.md|.html|g" | sed -r "s|~/|$HOME/|g" | pandoc $MATH --standalone --css $CSSFILE --template $TEMPLATE --metadata title=$(basename "$INPUT") --toc > $OUTPUT
