#!/usr/bin/env bash
swaylock --image $HOME/swaywall/swaylock/$(ls $HOME/swaywall/swaylock | shuf -n 1)
