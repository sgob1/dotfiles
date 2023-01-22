#!/usr/bin/env bash

file=~/org/diary
date=$(date --iso-8601=date)
if grep "^$date" "$file"; then
    nvim +/"$date" $file
else
    echo "" >> $file
    echo "$date" >> $file
    nvim +/"$date" $file
fi
