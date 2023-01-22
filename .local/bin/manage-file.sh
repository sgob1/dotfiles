#!/usr/bin/env bash

file=$1
result="$(grep -v '^#' $file | grep -v '^x' | bemenu -i -l 10 --nb "#282828ff" --nf "#ebdbb2ff" --hb "#fe8019ff" --hf "#282828ff" --fb "#282828ff" --ff "#ebdbb2ff" --tb "#fe8019ff" --tf "#282828ff" --fn 'Iosevka SS16 Medium 11' --line-height 26 -p 'todo.txt')"
echo "$result"
if [ ! -z "$result" -a "$result" != " " ]; then
    nvim +/"$result" $file
fi
