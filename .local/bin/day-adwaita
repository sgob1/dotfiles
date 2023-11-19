#!/usr/bin/env bash
gsettings set org.gnome.desktop.interface gtk-theme Adwaita
gsettings set org.gnome.desktop.interface icon-theme Adwaita
gsettings set org.gnome.desktop.interface color-scheme 'default'
if [ "$DESKTOP_SESSION" = "sway" ]; then
    killall swaybg
    notify-send --expire-time=4000 --urgency=low "Daily mode set. Let the light be."
    swaybg --image "$(cat ~/.config/sway/colors/gruvbox | ag "wallpaper_day" | awk '{$1=$2=""; print $0}' | xargs)" --mode fill
elif [ "$DESKTOP_SESSION" = "hyprland" ]; then
    notify-send --expire-time=4000 --urgency=low "Daily mode set. Let the light be."
fi
