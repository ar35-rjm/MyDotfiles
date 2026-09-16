#!/usr/bin/bash

grim ~/Pictures/Screenshots/$(date +%Y-%m-%d_%H-%M-%S).png &&\
grim - | wl-copy &&\
notify-send -u normal "Grim" "Screenshot Taken" ||\
notify-send -u normal Grim "Error! Screenshot Not Taken"
