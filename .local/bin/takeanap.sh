#!/usr/bin/env bash
swaylock --image "$HOME/walls/swaywm-shuffle/$(ls /home/sirduke/walls/swaywm-shuffle/ | rg -e .jpg -e .png -e .jpeg | shuf -n 1)" --daemonize
systemctl suspend
