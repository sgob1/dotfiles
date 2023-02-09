#!/usr/bin/env bash

term=$1
file=$2
result="$(grep -v '^#' $file | grep -v '^x' | bemenu -i -l 10 --nb "#282828ff" --nf "#ebdbb2ff" --hb "#fe8019ff" --hf "#282828ff" --fb "#282828ff" --ff "#ebdbb2ff" --tb "#fe8019ff" --tf "#282828ff" --fn 'Iosevka Slab Bold 11' --line-height 23 -p "$file")"
if [ ! -z "$result" -a "$result" != " " ]; then
    $term nvim +/"$result" $file
fi
