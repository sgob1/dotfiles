#!/usr/bin/env bash
source ~/.config/sway/colors/source.sh

term=$1
file=$2
result="$(grep -v '^#' $file | grep -v '^x' | bemenu -i -l 15 --nb $background --nf $white --hb $accent --hf $background --fb $background --ff $white --tb $accent --tf $background --fn "$font" --line-height 21 -p "$file")"
if [ ! -z "$result" -a "$result" != " " ]; then
    $term --title="Manage $file" nvim +/"$result" $file
fi
