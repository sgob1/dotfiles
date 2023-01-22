#!/bin/env/bash
input_line=$(bemenu -i -l 10 --nb "#282828ff" --nf "#ebdbb2ff" --hb "#a9b665ff" --hf "#282828ff" --fb "#282828ff" --ff "#ebdbb2ff" --tb "#a9b665ff" --tf "#282828ff" --fn 'Iosevka SS16 Medium 11' --line-height 26 -p 'New todo.txt entry:' --bottom < /dev/null)
file=~/org/todo.txt
if [ "$input_line" = "" ]; then
    notify-send --expire-time=10000 "No task has been added"
else
    echo $input_line >> $file
    sort --dictionary-order -o $file $file
    notify-send --expire-time=10000 "Successfully added $input_line to $file"
fi
