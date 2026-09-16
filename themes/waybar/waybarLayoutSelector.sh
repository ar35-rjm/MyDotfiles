#!/usr/bin/bash

# Configuration
THEME_DIR="$HOME/.config/waybar/layouts"
STYLE_DIR="$HOME/.config/waybar/styles"
ROFI_CONF="$HOME/.config/rofi/launchers/type-1/style-1.rasi"

files=$(ls "$THEME_DIR" | grep -E ".jsonc$")

if [ -z "$files" ]; then
    notify-send "Layout Picker" "No JSONC found in $THEME_DIR"
    exit 1
fi

choice=$(echo "$files" | rofi -dmenu -i -p "Select Layout" -config "$ROFI_CONF")

if [ -n "$choice" ]; then
    NEW_VALUE="$THEME_DIR/$choice"
    sed -i "4c\\waybar -s $STYLE_DIR/$choice.css\\\\" $HOME/.config/waybar/launch.sh
    sed -i "5c\\    -c $NEW_VALUE \&" $HOME/.config/waybar/launch.sh

    $HOME/.config/waybar/launch.sh
fi