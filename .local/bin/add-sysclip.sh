#!/usr/bin/env bash
entry=$(wl-paste)
file=~/org/sysclip
if [ "$entry" = "" ]; then
    notify-send --expire-time=10000 "Nothing to add"
elif grep "^$entry" "$file" | grep -q -v "^#"; then
    notify-send --expire-time=10000 "Already present entry"
else
    echo $entry >> $file
    notify-send --expire-time=10000 "Added $entry to $file"
fi
