#!/bin.sh
FRONT_APP=(
  label.font="JetBrainsMono Nerd Font:Bold:13.0"
  icon.font="sketchybar-app-font:Regular:14.0" 
  script="$PLUGIN_DIR/front_app.sh*"
  background.color=$TRANSPARENT
)

sketchybar --add item front_app left \
           --set front_app "${FRONT_APP[@]}" \
           --subscribe front_app front_app_switched
