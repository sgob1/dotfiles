#!/usr/bin/env bash
swaylock --image "$HOME/wallpapers-legacy/some-wallpapers-shuffle/$(ls $HOME/wallpapers-legacy/some-wallpapers-shuffle | rg -e .jpg -e .png -e .jpeg | shuf -n 1)"
