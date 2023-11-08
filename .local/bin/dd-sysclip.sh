#!/usr/bin/env bash
file=~/org/sysclip
query=$1
entry="$(grep -v '^#' $file | grep -v '^x' | sk --preview-window 'right:0%' --query=$query)"

if [ "$entry" = "" ]; then
    notify-send --expire-time=10000 "Nothing to remove from $file"
elif ! grep "^$entry" "$file" ; then
    notify-send --expire-time=10000 "Entry not found in $file"
else
    echo "$entry" | wl-copy
    grep -v "$entry" ~/org/sysclip > /tmp/sysclip
    cp /tmp/sysclip ~/org/sysclip
    notify-send --expire-time=10000 "dd $entry from $file"
fi
