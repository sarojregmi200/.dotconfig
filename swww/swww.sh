#!/bin/bash

WALLPAPERS_DIR=$HOME/Pictures/wallpapers/
## Gets a random wallpaper from the wallpaper dir
WALLPAPER=$(find "$WALLPAPERS_DIR" -type f -e "gif" | shuf -n 1)

swww img "$WALLPAPER"
