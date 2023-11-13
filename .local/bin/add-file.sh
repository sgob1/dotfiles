#!/usr/bin/env bash
source ~/.config/sway/colors/source.sh
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
    tags=$(bemenu -i -l 10 --nb $background --nf $white --hb $light_brown --hf $background --fb $background --ff $white --tb $light_brown --tf $background --fn "$font" --line-height 21 -p "Tags: #" < /dev/null)
    if [ ! -z "$tags" -a "$tags" != " " ]; then
        echo $input_file " #" $tags >> $file
    else
        echo $input_file >> $file
    fi
    notify-send --expire-time=10000 "Added $input_file to $file"
fi
