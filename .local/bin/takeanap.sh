#!/usr/bin/env bash
swaylock --image /home/sirduke/wallpapers-legacy/some-wallpapers-shuffle/$(ls /home/sirduke/wallpapers-legacy/some-wallpapers-shuffle/ | rg -e .jpg -e .png | shuf -n 1) --daemonize
systemctl suspend
