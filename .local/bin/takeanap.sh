#!/usr/bin/env bash
swaylock --image "$HOME/walls/shuffle/$(ls /home/sirduke/walls/shuffle/ | rg -e .jpg -e .png -e .jpeg | shuf -n 1)" --daemonize
systemctl suspend
