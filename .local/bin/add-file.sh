#!/usr/bin/env bash
if [ "$1" = "" ]; then
    input_file=$(wl-paste)
else
    input_file="$1"
fi
file=~/org/files
if [ "$input_file" = "" ]; then
    notify-send --expire-time=10000 "Nothing to add to input_files"
elif grep "^$input_file" "$file" | grep -q -v "^#"; then
    notify-send --expire-time=10000 "File already present"
else
    tags=$(bemenu -i -l 10 --nb "#000000ff" --nf "#f6f5f4ff" --hb "#b5835aff" --hf "#000000ff" --fb "#000000ff" --ff "#f6f5f4ff" --tb "#b5835aff" --tf "#000000ff" --fn 'Iosevka Slab Bold 11' --line-height 23 -p "Tags: #" < /dev/null)
    if [ ! -z "$tags" -a "$tags" != " " ]; then
        echo $input_file " #" $tags >> $file
    else
        echo $input_file >> $file
    fi
    notify-send --expire-time=10000 "Added $input_file to $file"
fi
