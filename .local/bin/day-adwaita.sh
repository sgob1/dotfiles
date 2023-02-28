#!/usr/bin/env bash
gsettings set org.gnome.desktop.interface gtk-theme Adwaita
gsettings set org.gnome.desktop.interface icon-theme Adwaita
gsettings set org.gnome.desktop.interface color-scheme 'default'
if [ "$DESKTOP_SESSION" = "sway" ]; then
    killall swaybg
    swaybg --image "/home/sirduke/backgrounds/miramare-reserve-aberr.jpg"
fi
notify-send --expire-time=4000 --urgency=low "$(basename $0) -> Daily mode set. Let the light be."
