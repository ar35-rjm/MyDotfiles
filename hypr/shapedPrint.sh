#!/usr/bin/bash

SHAPE="$(slurp)"

grim -g "$SHAPE" ~/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%M-%S).png &&\
grim -g " $SHAPE" - | wl-copy &&\
notify-send -u normal "Grim" "Screenshot Taken" ||\
notify-send -u normal Grim "Error! Screenshot Not Taken"
