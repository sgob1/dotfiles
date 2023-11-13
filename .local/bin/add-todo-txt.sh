#!/usr/bin/env bash
source ~/.config/sway/colors/source.sh
file=~/org/todo.txt
date=$(date --iso-8601)

task=$(bemenu -i -l 10 --nb $background --nf $white --hb $pastel_blue --hf $background --fb $background --ff $white --tb $pastel_blue --tf $background --fn "$font" --line-height 21 -p "New todo.txt entry:" < /dev/null)

if [ "$task" = "" ]; then
    notify-send --expire-time=10000 "No task has been added"
else
    priority=$(bemenu -i -l 10 --nb $background --nf $white --hb $pastel_blue --hf $background --fb $background --ff $white --tb $pastel_blue --tf $background --fn "$font" --line-height 21 -p "Priority of task $task:" < /dev/null)

    has_date=$(bemenu -i -l 10 --nb $background --nf $white --hb $pastel_blue --hf $background --fb $background --ff $white --tb $pastel_blue --tf $background --fn "$font" --line-height 21 -p "Insert the date (y/n)?" < /dev/null)

    if [[ $has_date == "y" ]]; then
        task="$date $task"
    fi

    if [ $priority != "" ]; then
        task="($priority) $task"
    fi
    echo $task >> $file
    sort --dictionary-order -o $file $file
    notify-send --expire-time=10000 "Added $task to $file"
fi
