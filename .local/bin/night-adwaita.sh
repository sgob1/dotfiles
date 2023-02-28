#!/usr/bin/env bash
gsettings set org.gnome.desktop.interface gtk-theme Adwaita-dark
gsettings set org.gnome.desktop.interface icon-theme Adwaita
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
if [ "$DESKTOP_SESSION" = "sway" ]; then
    killall swaybg
    swaybg --image "/home/sirduke/backgrounds/viale.jpg"
fi
#notify-send --expire-time=5000 --urgency=low -i ~/.local/share/icons/utilities-terminal-symbolic.symbolic.png $(basename $0) "Night mode set"

