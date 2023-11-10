#!/usr/bin/env bash
gsettings set org.gnome.desktop.interface gtk-theme Adwaita-dark
gsettings set org.gnome.desktop.interface icon-theme Adwaita
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
if [ "$DESKTOP_SESSION" = "sway" ]; then
    killall swaybg
    notify-send --expire-time=4000 --urgency=low "Night mode set. Take care of your eyes."
    swaybg --image "$(cat ~/.config/sway/colors/gruvbox | ag "wallpaper_night" | awk '{$1=$2=""; print $0}' | xargs)" --mode fill
fi
