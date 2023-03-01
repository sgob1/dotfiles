#!/usr/bin/env bash
bookmark=$(wl-paste)
file=~/org/bookmarks
searched=$(grep -q "^$bookmark$" "$file")
if [ "$bookmark" = "" ]; then
    notify-send --expire-time=10000 "Nothing to add to bookmarks"
elif grep "^$bookmark" "$file" | grep -q -v "^#"; then
    notify-send --expire-time=10000 "Bookmark already present"
else
    tags=$(bemenu -i -l 10 --nb "#000000ff" --nf "#f6f5f4ff" --hb "#b5835aff" --hf "#000000ff" --fb "#000000ff" --ff "#f6f5f4ff" --tb "#b5835aff" --tf "#000000ff" --fn 'Iosevka Slab Bold 11' --line-height 23 -p "Tags: #" < /dev/null)
    if [ ! -z "$tags" -a "$tags" != " " ]; then
        echo $bookmark " #" $tags >> $file
    else
        echo $bookmark >> $file
    fi
    notify-send --expire-time=10000 "Added $bookmark to $file"
fi
