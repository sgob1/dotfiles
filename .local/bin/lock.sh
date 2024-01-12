#!/usr/bin/env bash
pics_dir="$HOME/walls/shuffle"
random_pic="$(ls $pics_dir | rg -e .jpg -e .png -e .jpeg | shuf -n 1)"
picture="$pics_dir/$random_pic"
swaylock --image "$picture"
