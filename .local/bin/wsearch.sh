#!/usr/bin/env bash
source ~/.config/sway/colors/source.sh

launch_browser=$1
search_pattern=$2
query=$(wl-paste | sed '/^$/d' | bemenu -i -l 10 --nb $background --nf $white --hb $firefox_red --hf $background --fb $background --ff $white --tb $firefox_red --tf $background --fn "$font" --line-height 23 -p "wsearch")
echo $query
echo $launch_browser
if [ ! -z "$query" -a "$query" != " " ]; then
    $launch_browser "$search_pattern$query"
fi
