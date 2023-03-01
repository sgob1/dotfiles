#!/usr/bin/env bash

file="$(grep -v '^#' ~/org/files | grep . | bemenu -i -l 8 --nb "#000000ff" --nf "#f6f5f4" --hb "#8ff0a4" --hf "#000000ff" --fb "#000000ff" --ff "#f6f5f4" --tb "#8ff0a4" --tf "#000000ff" --fn 'Iosevka Slab Bold 11' --line-height 23 -p 'Files' | cut -d '#' -f1 | xargs)"
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
