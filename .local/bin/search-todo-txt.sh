#!/usr/bin/bash
set -e

file=~/org/todo.txt
query=$1
result="$(grep -v '^#' $file | grep -v '^x' | sk --preview-window 'right:0%' --query=$query)"
if [ ! -z "$result" -a "$result" != " " ]; then
    lnum=$(cat $file | grep -n "^$result" | head -n 1 | cut -f1 -d":")
    hx +"$lnum" $file
fi

