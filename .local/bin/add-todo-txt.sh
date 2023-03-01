#!/usr/bin/env bash
file=~/org/todo.txt
date=$(date --iso-8601)

task=$(bemenu -i -l 10 --nb "#000000ff" --nf "#f6f5f4ff" --hb "#62a0eaff" --hf "#000000ff" --fb "#000000ff" --ff "#f6f5f4ff" --tb "#62a0eaff" --tf "#000000ff" --fn 'Iosevka SS16 Medium 11' --line-height 23 -p "New todo.txt entry:" < /dev/null)

if [ "$task" = "" ]; then
    notify-send --expire-time=10000 "No task has been added"
else
    priority=$(bemenu -i -l 10 --nb "#000000ff" --nf "#f6f5f4ff" --hb "#62a0eaff" --hf "#000000ff" --fb "#000000ff" --ff "#f6f5f4ff" --tb "#62a0eaff" --tf "#000000ff" --fn 'Iosevka SS16 Medium 11' --line-height 23 -p "Priority of task $task:" < /dev/null)

    has_date=$(bemenu -i -l 10 --nb "#000000ff" --nf "#f6f5f4ff" --hb "#62a0eaff" --hf "#000000ff" --fb "#000000ff" --ff "#f6f5f4ff" --tb "#62a0eaff" --tf "#000000ff" --fn 'Iosevka SS16 Medium 11' --line-height 23 -p "Insert the date (y/n)?" < /dev/null)

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
