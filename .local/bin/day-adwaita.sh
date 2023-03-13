#!/usr/bin/env bash
gsettings set org.gnome.desktop.interface gtk-theme Adwaita
gsettings set org.gnome.desktop.interface icon-theme Adwaita
gsettings set org.gnome.desktop.interface color-scheme 'default'
if [ "$DESKTOP_SESSION" = "sway" ]; then
    killall swaybg
    swaybg --image "$(cat ~/.config/sway/colors/adwaita | ag "wallpaper_day" | awk '{print $3}')"
fi
#notify-send --expire-time=4000 --urgency=low "Daily mode set. Let the light be."
