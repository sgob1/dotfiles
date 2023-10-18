#!/usr/bin/bash
set -e
source ~/.config/sway/colors/source.sh
file=~/org/todo.txt
date=$(date --iso-8601)

read -p "New todo.txt entry: 
" task


if [ "$task" = "" ]; then
    notify-send --expire-time=10000 "No task has been added"
else
    read -p "Priority of task $task: " priority
    read -p "Insert the date (y/n)? " has_date

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

