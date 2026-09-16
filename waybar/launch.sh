#!/usr/bin/bash

killall -9 waybar
waybar -s /home/roger/.config/waybar/styles/gaming.jsonc.css\
    -c /home/roger/.config/waybar/layouts/gaming.jsonc &

killall -9 swaync &
#swaync &
