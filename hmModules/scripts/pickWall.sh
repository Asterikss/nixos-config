#!/usr/bin/env bash

IMAGE_DIR="$HOME/cave/walls"

SELECTED_IMAGE=$(find "$IMAGE_DIR" -type f -printf "%f\n" | rofi -theme purple -dmenu -p "Wall")

if [ -n "$SELECTED_IMAGE" ]; then
  swww img "$IMAGE_DIR/$SELECTED_IMAGE"
fi
