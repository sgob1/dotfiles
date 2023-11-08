#!/usr/bin/bash
set -e

file=~/org/sysclip
query=$1
result="$(grep -v '^#' $file | grep -v '^x' | sk --query=$query)"
if [ ! -z "$result" -a "$result" != " " ]; then
    echo $result | wl-copy
    notify-send "Grabbed $result"
fi

