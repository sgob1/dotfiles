#!/usr/bin/env bash
gsettings set org.gnome.desktop.interface gtk-theme Adwaita
gsettings set org.gnome.desktop.interface icon-theme Adwaita
gsettings set org.gnome.desktop.interface color-scheme 'default'
if [ "$DESKTOP_SESSION" = "sway" ]; then
    killall swaybg
    swaybg --image "/home/sirduke/backgrounds/miramare-reserve-aberr.jpg"
fi
#notify-send --expire-time=5000 --urgency=low -i ~/.local/share/icons/utilities-terminal-symbolic.symbolic.png $(basename $0) "Day mode set"
