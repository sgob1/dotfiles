#!/usr/bin/env bash
bookmark=$(wl-paste)
file=~/org/bookmarks
searched=$(grep -q "^$bookmark$" "$file")
if [ "$bookmark" = "" ]; then
    notify-send --expire-time=10000 "Nothing to add to bookmarks"
elif grep "^$bookmark" "$file" | grep -q -v "^#"; then
    notify-send --expire-time=10000 "Bookmark already present"
else
    tags=$(bemenu -i -l 10 --nb "#282828ff" --nf "#ebdbb2ff" --hb "#a9b665ff" --hf "#282828ff" --fb "#282828ff" --ff "#ebdbb2ff" --tb "#a9b665ff" --tf "#282828ff" --fn 'Iosevka Slab Bold 11' --line-height 23 -p "Tags: #" < /dev/null)
    if [ ! -z "$tags" -a "$tags" != " " ]; then
        echo $bookmark " #" $tags >> $file
    else
        echo $bookmark >> $file
    fi
    notify-send --expire-time=10000 "Successfully added $bookmark to $file"
fi
