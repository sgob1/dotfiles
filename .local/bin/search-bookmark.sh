#!/usr/bin/bash
set -e

file=~/org/bookmarks
query=$1
result="$(grep -v '^#' $file | grep . | fzf --preview-window 'right:0%' --query=$query | cut -d ' ' -f1)"
if [ ! -z "$result" -a "$result" != " " ]; then
    echo $result | wl-copy
    notify-send "Grabbed $result"
fi

