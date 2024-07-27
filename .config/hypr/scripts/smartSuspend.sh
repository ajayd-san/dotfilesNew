#!/bin/bash

res=$(hyprctl monitors)

if ! echo "$res" | grep -q "ID 1"; then
    notify-send "hola"
fi
