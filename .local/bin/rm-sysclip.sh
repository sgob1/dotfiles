#!/bin/env/bash
entry="$(cat ~/org/sysclip | grep . | bemenu -i -l 10 --nb "#282828ff" --nf "#ebdbb2ff" --hb "#d3869bff" --hf "#282828ff" --fb "#282828ff" --ff "#ebdbb2ff" --tb "#d3869bff" --tf "#282828ff" --fn 'Iosevka SS16 Medium 11' --line-height 26 -p "Sysclip")"
file=~/org/sysclip
if [ "$entry" = "" ]; then
    notify-send --expire-time=10000 "Nothing to remove from $file"
elif ! grep "^$entry" "$file" ; then
    notify-send --expire-time=10000 "Entry not found in $file"
else
    grep -v "$entry" ~/org/sysclip > /tmp/sysclip
    cp /tmp/sysclip ~/org/sysclip
    notify-send --expire-time=10000 "Successfully removed $entry from $file"
fi
