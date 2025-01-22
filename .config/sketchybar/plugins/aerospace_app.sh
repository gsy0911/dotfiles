#!/bin/sh

# Some events send additional information specific to the event in the $INFO
# variable. E.g. the front_app_switched event sends the name of the newly
# focused application in the $INFO variable:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

if [ "$SENDER" = "front_app_switched" ]; then
  MONITOR_NUM="$(aerospace list-monitors --count)"
  WINDOW1="$(aerospace list-workspaces --monitor 1 --visible)"
  WINDOW1_NON="$(aerospace list-workspaces --monitor 1 --visible no --empty no | paste -s -d ',' -)"
  LABEL="$WINDOW1($WINDOW1_NON)"
  if [ "$MONITOR_NUM" = "3" ]; then
    WINDOW2="$(aerospace list-workspaces --monitor 2 --visible)"
    WINDOW2_NON="$(aerospace list-workspaces --monitor 2 --visible no --empty no | paste -s -d ',' -)"
    WINDOW3="$(aerospace list-workspaces --monitor 3 --visible)"
    WINDOW3_NON="$(aerospace list-workspaces --monitor 3 --visible no --empty no | paste -s -d ',' -)"
    LABEL="$WINDOW1($WINDOW1_NON) | $WINDOW2($WINDOW2_NON) | $WINDOW3($WINDOW3_NON)"
  fi
  
  sketchybar --set aerospace_app label="$LABEL"
fi

# if [ "$SENDER" = "front_app_switched" ]; then
#   sketchybar --set $NAME label="$INFO" icon="$($CONFIG_DIR/plugins/icon_map_fn.sh "$INFO")"
# fi
