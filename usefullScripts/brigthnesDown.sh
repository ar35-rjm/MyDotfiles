#!/usr/bin/bash

for ((i=0; i<20; i++))
do
    brightnessctl -e4 -n2 set 2%-
    sleep 0.015s
done
