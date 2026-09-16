#!/usr/bin/bash

# Configuration
WALLPAPER_DIR="$HOME/.config/themes/colorSchemes/$(cat "$HOME/.config/themes/colorSchemes/.currentTheme")/wallpapers/"
ROFI_CONF="$HOME/.config/rofi/launchers/type-3/style-6.rasi"

files=$(ls "$WALLPAPER_DIR" | grep -E ".jpg$|.jpeg$|.png$|.webp$")

if [ -z "$files" ]; then
    notify-send "Wallpaper Picker" "No wallpapers found in $WALLPAPER_DIR"
    exit 1
fi

choice=$(echo "$files" | rofi -dmenu -i -p "Select Wallpaper" -config "$ROFI_CONF")

if [ -n "$choice" ]; then
    awww img "$WALLPAPER_DIR/$choice" --transition-type random --transition-fps 100
fi