#!/bin/sh

sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- init --apply danieldirks
