#!/usr/bin/env bash
swaylock --image $HOME/backgrounds//$(ls $HOME/backgrounds | rg -e .jpg -e .png | shuf -n 1) --daemonize
systemctl suspend
