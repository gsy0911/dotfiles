#!/bin/sh

TERM_ITEM=(
  background.color=$TRANSPARENT
  label.font="Hack Nerd Font:Bold:12.0"
)

sketchybar --add item term left \
           --set term "${TERM_ITEM[@]}" \
           --set term update_freq=300 script="$PLUGIN_DIR/term.sh"
