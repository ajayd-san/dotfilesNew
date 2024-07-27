#!/bin/bash

mkdir -p ~/.cache/wallpaper/

wallpaper="/home/default/Pictures/walls/muichiro_tokaku.jpeg"

ext=$(echo $wallpaper | awk -F '.' '{ print $NF }')

current_wall_in_cache=~/.cache/wallpaper/current_wall.$ext

cp $wallpaper $current_wall_in_cache

magick $current_wall_in_cache -blur 10x5 ~/.cache/wallpaper/cur_wal_blur.$ext

wal -i $wallpaper

killall hyprpaper
hyprpaper
