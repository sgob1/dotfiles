#!/usr/bin/env bash
if [ "$DESKTOP_SESSION" = "sway" ]; then
    killall swaybg
    swaybg --image $HOME/walls/google-earth/$(ls $HOME/walls/google-earth | rg -e .jpg -e .png | shuf -n 1) --mode fill
else
    gsettings set org.gnome.desktop.background picture-uri ~/walls/google-earth/$(ls ~/walls/google-earth | shuf | head -n 1)
fi
