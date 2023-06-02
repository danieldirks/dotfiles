#!/bin/sh

sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply danieldirks
