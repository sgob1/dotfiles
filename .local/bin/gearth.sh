#!/usr/bin/env bash
if [ "$DESKTOP_SESSION" = "sway" ]; then
    killall swaybg
    swaybg --image $HOME/wallpapers-legacy/google-earth/$(ls $HOME/wallpapers-legacy/google-earth | rg -e .jpg -e .png | shuf -n 1) --mode fill
else
    gsettings set org.gnome.desktop.background picture-uri ~/wallpapers-legacy/google-earth/$(ls ~/wallpapers-legacy/google-earth | shuf | head -n 1)
fi
