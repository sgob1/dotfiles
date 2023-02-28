#!/usr/bin/env bash
entry="$(cat ~/org/sysclip | grep . | bemenu -i -l 10 --nb "#000000ff" --nf "#ebdbb2ff" --hb "#dc8addff" --hf "#000000ff" --fb "#000000ff" --ff "#ebdbb2ff" --tb "#dc8addff" --tf "#000000ff" --fn 'Iosevka Slab Bold 11' --line-height 23 -p "Sysclip dd")"
file=~/org/sysclip
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
