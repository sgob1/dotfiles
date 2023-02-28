#!/usr/bin/env bash

term=$1
file=$2
result="$(grep -v '^#' $file | grep -v '^x' | bemenu -i -l 10 --nb "#000000ff" --nf "#f6f5f4ff" --hb "#8ff0a4ff" --hf "#000000ff" --fb "#000000ff" --ff "#f6f5f4ff" --tb "#8ff0a4ff" --tf "#000000ff" --fn 'Iosevka Slab Bold 11' --line-height 23 -p "$file")"
if [ ! -z "$result" -a "$result" != " " ]; then
    $term --title="Manage $file" nvim +/"$result" $file
fi
