#!/usr/bin/env bash
swaylock --image $HOME/wallpapers-legacy/google-earth//$(ls $HOME/wallpapers-legacy/google-earth | rg -e .jpg -e .png | shuf -n 1)
