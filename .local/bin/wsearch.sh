#!/usr/bin/env bash

launch_browser=$1
search_pattern=$2
query=$(wl-paste | sed '/^$/d' | bemenu -i -l 10 --nb "#000000ff" --nf "#f6f5f4ff" --hb "#f66151ff" --hf "#000000ff" --fb "#000000ff" --ff "#f6f5f4ff" --tb "#f66151ff" --tf "#000000ff" --fn 'Iosevka Slab Bold 11' --line-height 23 -p "wsearch")
echo $query
echo $launch_browser
if [ ! -z "$query" -a "$query" != " " ]; then
    $launch_browser "$search_pattern$query"
fi
