#!/usr/bin/bash
set -e
file=~/org/bookmarks
bookmark="$(wl-paste)"


if [ "$bookmark" = "" ]; then
    notify-send --expire-time=10000 "Nothing to add to bookmarks"
elif grep "^$bookmark" "$file" | grep -q -v "^#"; then
    notify-send --expire-time=10000 "Bookmark already present"
else
    read -p "Tags: 
" tags

    if [ ! -z "$tags" -a "$tags" != " " ]; then
        echo $bookmark " #" $tags >> $file
    else
        echo $bookmark >> $file
    fi
    notify-send --expire-time=10000 "Added $bookmark to $file"
fi

