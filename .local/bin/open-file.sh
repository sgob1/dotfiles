#!/usr/bin/env bash
source ~/.config/sway/colors/source.sh

file="$(grep -v '^#' ~/org/files | grep . | bemenu -i -l 8 --nb $background --nf $white --hb $light_green --hf $background --fb $background --ff $white --tb $light_green --tf $background --fn "$font" --line-height 21 -p 'Files' | cut -d '#' -f1 | xargs)"
if [ "$file" = "" ]; then
    true
elif [ -d "${file}" ]; then
    footclient -e ranger --selectfile="$file"
else
    if [ "${file: -4}" == ".pdf" ]; then
        xdg-open "$file"
    else
        footclient -e ranger --selectfile="$file"
    fi
fi
