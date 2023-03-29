#!/usr/bin/env bash

player=$(playerctl metadata xesam:title 2> /dev/null)
playerstatus=$(playerctl status 2> /dev/null)
if [ "$player" != "" ]; then
	artist=$(playerctl metadata xesam:artist 2> /dev/null)
	artist="- $artist"
	if [ "$artist" != "- " ]; then
		player="$player $artist"
	fi
	if [ "$playerstatus" == "Playing" ]; then
		player="Playing:  $player"
	elif [ "$playerstatus" == "Paused" ]; then
		player="Pause:  $player"
	fi
fi

network=$(nmcli -t -f name connection show --active | head -n 1)
if [ "$network" != "" ]; then
    network="WiFi:  $network"
else
    network="WiFi:  Off-grid"
fi

mute=$(amixer get Master | grep -o 'off' | tail -1)
if [ "$mute" == "off" ];
	then volume=" Muted"
else volume=$(pactl list sinks | grep -o -P '.{0,3}%' | tail -3 | head -1) 
fi
volume="Vol: $volume"

light=$(light | cut -f 1 -d ".")
light="Bri:  $light%"

hostname=$(hostnamectl hostname)
hostname="Hst: $hostname"

battery=$(acpi | grep -o -P '.{0,3}%' | head -1)
battery="Bat: $battery"

date=$(date +"%a %d %b %Y  |  %H:%M  |")

echo -e -n "$player  |  $network  |  $volume  |  $light  |  $battery  |  $hostname  |  $date"
