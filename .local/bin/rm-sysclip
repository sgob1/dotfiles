#!/usr/bin/env bash
source ~/.config/sway/colors/source.sh
entry="$(cat ~/org/sysclip | grep . | bemenu -i -l 10 --nb $background --nf $white --hb $pastel_purple --hf $background --fb $background --ff $white --tb $pastel_purple --tf $background --fn "$font" --line-height 21 -p "Sysclip dd")"
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
