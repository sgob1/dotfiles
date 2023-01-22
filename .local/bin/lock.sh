#!/usr/bin/env bash
swaylock --image $HOME/swaywall/swaylock/$(ls $HOME/swaywall/trieste | shuf -n 1)
