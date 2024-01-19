#!/usr/bin/env bash
source ~/.config/sway/colors/source.sh

term=$1
file=$2
result="$(grep -v '^#' $file | grep -v '^x' | bemenu -i -l 15 --nb $background --nf $white --hb $accent --hf $background --fb $background --ff $white --tb $accent --tf $background --fn "$font" --line-height 21 -p "$file")"
if [ ! -z "$result" -a "$result" != " " ]; then
    lnum=$(cat $file | grep -n "^$result" | head -n 1 | cut -f1 -d":")
    $term --title="Manage $file" hx +"$lnum" $file
fi
