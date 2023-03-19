#!/usr/bin/env bash
gsettings set org.gnome.desktop.interface gtk-theme Adwaita
gsettings set org.gnome.desktop.interface icon-theme Adwaita
gsettings set org.gnome.desktop.interface color-scheme 'default'
gsettings set org.gnome.shell.extensions.user-theme name "Adwaita"
gsettings set org.gnome.desktop.background picture-uri ~/wallpapers-legacy/Library/etienne-bosiger-WTkUYzNCu-A-unsplash.jpg
if [ "$DESKTOP_SESSION" = "sway" ]; then
    killall swaybg
    swaybg --image "$(cat ~/.config/sway/colors/gruvbox | ag "wallpaper_day" | awk '{print $3}')" --mode fill
fi
#notify-send --expire-time=4000 --urgency=low "Daily mode set. Let the light be."
