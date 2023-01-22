#!/usr/bin/env bash
swaylock --image $HOME/swaywall/trieste/$(ls $HOME/swaywall/trieste | shuf -n 1) --daemonize
systemctl suspend
