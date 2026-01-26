#!/bin/sh


BATTERY_ITEM=(
  background.color=$TRANSPARENT
  label.font="Hack Nerd Font:Bold:12.0"
)

sketchybar --add item battery right \
           --set battery "${BATTERY_ITEM[@]}" \
           --set battery update_freq=120 script="$PLUGIN_DIR/battery.sh" \
           --subscribe battery system_woke power_source_change
