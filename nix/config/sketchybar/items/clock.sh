#!/bin/sh

CLOCK_ITEM=(
  background.color=$TRANSPARENT
  label.font="Hack Nerd Font:Bold:12.0"
)

sketchybar --add item clock right \
           --set clock "${CLOCK_ITEM[@]}" \
           --set clock update_freq=10 script="$PLUGIN_DIR/clock.sh"
