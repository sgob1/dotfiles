#!/usr/bin/env bash
entry=$(wl-paste)
file=~/org/sysclip
searched=$(grep -q "^$entry$" "$file")
if [ "$entry" = "" ]; then
    notify-send --expire-time=10000 "Nothing to add"
elif grep "^$entry" "$file" | grep -q -v "^#"; then
    notify-send --expire-time=10000 "Already present entry"
else
    echo $entry >> $file
    notify-send --expire-time=10000 "Successfully added $entry to $file"
fi
