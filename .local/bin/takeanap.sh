#!/usr/bin/env bash
swaylock --image $HOME/backgrounds//$(ls $HOME/backgrounds | shuf -n 1) --daemonize
systemctl suspend
