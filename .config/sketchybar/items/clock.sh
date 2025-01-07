#!/bin/sh

CLOCK_ITEM=(
  background.color=$BOARDER_BG_COLOR
)

sketchybar --add item clock right \
           --set clock "${CLOCK_ITEM[@]}" \
           --set clock update_freq=10 script="$PLUGIN_DIR/clock.sh*"
