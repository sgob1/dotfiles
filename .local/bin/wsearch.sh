#!/usr/bin/env bash

launch_browser=$1
search_pattern=$2
query=$(wl-paste | sed '/^$/d' | bemenu -i -l 10 --nb "#282828ff" --nf "#ebdbb2ff" --hb "#fe8019ff" --hf "#282828ff" --fb "#282828ff" --ff "#ebdbb2ff" --tb "#fe8019ff" --tf "#282828ff" --fn 'Iosevka Slab Bold 11' --line-height 23 -p "wsearch")
echo $query
echo $launch_browser
if [ ! -z "$query" -a "$query" != " " ]; then
    $launch_browser "$search_pattern$query"
fi
