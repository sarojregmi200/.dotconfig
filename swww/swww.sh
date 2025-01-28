#!/bin/bash

WALLPAPERS_DIR=~/Documents/wallpaper/current
## Gets a random wallpaper from the wallpaper dir
WALLPAPER=$(find "$WALLPAPERS_DIR" -type f | shuf -n 1)

swww img "$WALLPAPER"
