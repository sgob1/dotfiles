#!/usr/bin/env bash
source ~/.config/sway/colors/adwaita.sh

term=$1
file=$2
result="$(grep -v '^#' $file | grep -v '^x' | bemenu -i -l 10 --nb $background --nf $white --hb $light_green --hf $background --fb $background --ff $white --tb $light_green --tf $background --fn "$font" --line-height 23 -p "$file")"
if [ ! -z "$result" -a "$result" != " " ]; then
    $term --title="Manage $file" nvim +/"$result" $file
fi
