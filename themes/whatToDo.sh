#!/usr/bin/bash


ROFI_CONF="$HOME/.config/rofi/launchers/type-1/style-1.rasi"

choice=$(echo "Wallpaper\
ColorScheme\
WaybarLayout" | rofi -dmenu -i -p "Select Theme" -config "$ROFI_CONF")

if [ -n "$choice" ]; then
    echo "it works"
fi