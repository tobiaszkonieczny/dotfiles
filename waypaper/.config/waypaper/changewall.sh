#!/bin/bash

wal -i "$1" && killall -SIGUSR2 waybar 
ln -sf "$1" ~/.cache/wal/current-wallpaper 
swaync-client -R && swaync-client -rs
pkill waypaper 

