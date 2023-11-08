#!/usr/bin/bash
set -e

file=~/org/todo.txt
query=$1
result="$(grep -v '^#' $file | grep -v '^x' | sk --preview-window 'right:0%' --query=$query)"
if [ ! -z "$result" -a "$result" != " " ]; then
    nvim +/"$result" $file
fi

