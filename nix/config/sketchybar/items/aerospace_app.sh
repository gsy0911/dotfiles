#!/bin.sh
AEROSPACE_APP=(
  label.font="Hack Nerd Font:Bold:12.0"
  script="$PLUGIN_DIR/aerospace_app.sh*"
  background.color=$TRANSPARENT
)

sketchybar --add item aerospace_app left \
           --set aerospace_app "${AEROSPACE_APP[@]}" \
           --subscribe aerospace_app front_app_switched
