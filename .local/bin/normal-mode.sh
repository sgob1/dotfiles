#!/usr/bin/env bash
gsettings set org.gnome.desktop.session idle-delay 300
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
gsettings set org.gnome.settings-daemon.plugins.power idle-dim true
#notify-send --expire-time=5000 --urgency=low -i ~/.local/share/icons/utilities-terminal-symbolic.symbolic.png $(basename $0) "Normal mode set"
