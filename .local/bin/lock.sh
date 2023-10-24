#!/usr/bin/env bash
swaylock --image "$HOME/walls/some-wallpapers-shuffle/$(ls $HOME/walls/some-wallpapers-shuffle | rg -e .jpg -e .png -e .jpeg | shuf -n 1)"
