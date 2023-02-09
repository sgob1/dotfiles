#!/usr/bin/env bash

term=$1
file=~/org/diary
date=$(date --iso-8601=date)
if grep "^$date" "$file"; then
    $term nvim +/"$date" $file
else
    echo "" >> $file
    echo "$date" >> $file
    $term nvim +/"$date" $file
fi
