#!/usr/bin/env bash

term=$1
file=~/org/diary
date=$(date --iso-8601=date)
if grep "^$date" "$file"; then
    lnum=$(cat $file | grep -n "^$date" | head -n 1 | cut -f1 -d":")
    #$term nvim +/$date $file
    $term hx +$lnum $file
else
    echo "" >> $file
    echo "$date" >> $file
    lnum=$(cat $file | grep -n "^$date" | head -n 1 | cut -f1 -d":")
    #$term nvim +/$date $file
    $term hx +$lnum $file
fi
