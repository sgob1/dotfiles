#!/usr/bin/env bash
source ~/.config/sway/colors/source.sh
bookmark=$(wl-paste)
file=~/org/bookmarks
if [ "$bookmark" = "" ]; then
    notify-send --expire-time=10000 "Nothing to add to bookmarks"
elif grep "^$bookmark" "$file" | grep -q -v "^#"; then
    notify-send --expire-time=10000 "Bookmark already present"
else
    tags=$(bemenu -i -l 10 --nb $background --nf $white --hb $light_brown --hf $background --fb $background --ff $white --tb $light_brown --tf $background --fn "$font" --line-height 21 -p "Tags: #" < /dev/null)
    if [ ! -z "$tags" -a "$tags" != " " ]; then
        echo $bookmark " #" $tags >> $file
    else
        echo $bookmark >> $file
    fi
    notify-send --expire-time=10000 "Added $bookmark to $file"
fi
