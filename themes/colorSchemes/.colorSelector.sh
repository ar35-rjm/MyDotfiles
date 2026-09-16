#!/usr/bin/bash

# Configuration
COLOR_DIR="$HOME/.config/themes/colorSchemes"
ROFI_CONF="$HOME/.config/rofi/launchers/type-1/style-1.rasi"

colors=$(ls "$COLOR_DIR")

if [ -z "$colors" ]; then
    notify-send "Color Picker" "No folder found in $COLOR_DIR"
    exit 1
fi

choice=$(echo "$colors" | rofi -dmenu -i -p "Select Color Scheme" -config "$ROFI_CONF")

if [ -n "$choice" ]; then
    NEW_LOCATION=$COLOR_DIR/$choice

    ##################
    # SET THE COLORS #
    ##################

    #Hypr
    echo $choice > "$HOME/.config/hypr/hyprland/colors/pallette.txt"
    cat "$NEW_LOCATION/hypr/colors.conf" > "$HOME/.config/hypr/hyprland/colors/colors.conf"
    hyprctl reload & disown

    #Rofi
    cat "$NEW_LOCATION/rofi/colors.rasi" > "$HOME/.config/rofi/launchers/type-1/shared/colors.rasi"
    cat "$NEW_LOCATION/rofi/colors.rasi" > "$HOME/.config/rofi/powermenu/type-1/shared/colors.rasi"
    cat "$NEW_LOCATION/rofi/colors.rasi" > "$HOME/.config/rofi/launchers/type-2/shared/colors.rasi"
    cat "$NEW_LOCATION/rofi/colors.rasi" > "$HOME/.config/rofi/launchers/type-3/shared/colors.rasi"
    cat "$NEW_LOCATION/rofi/colors.rasi" > "$HOME/.config/rofi/launchers/type-4/shared/colors.rasi"
    #/home/roger/.config/rofi/powermenu/type-1/shared/colors.rasi
    #Waybar
    cat "$NEW_LOCATION/waybar/colors.css" > "$HOME/.config/waybar/styles/colors/colors.css"
    $HOME/.config/waybar/launch.sh

    #Kitty
    #Kitty
    sed -i "31c\\include $HOME/.config/kitty/colors/custom/$choice.conf\\" $HOME/.config/kitty/kitty.conf
    kill -USR1 $(pgrep kitty)

    #Keep track of the current theme
    echo $choice > $HOME/.config/themes/colorSchemes/.currentTheme

fi