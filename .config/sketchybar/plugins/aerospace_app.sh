#!/bin/sh

# Some events send additional information specific to the event in the $INFO
# variable. E.g. the front_app_switched event sends the name of the newly
# focused application in the $INFO variable:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting
function workspace() {
  if [[ $1 ]]; then
    WINDOW="$(aerospace list-workspaces --monitor $1 --visible)"
    WINDOW_NON="$(aerospace list-workspaces --monitor $1 --visible no --empty no | paste -s -d ',' -)"
    LABEL="$WINDOW($WINDOW_NON)"
    echo $LABEL
  fi
}

if [ "$SENDER" = "front_app_switched" ]; then
  MONITOR_NUM="$(aerospace list-monitors --count)"
  WINDOW1="$(workspace 1)"
  LABEL="$WINDOW1($WINDOW1_NON)"
  if [ "$MONITOR_NUM" = "3" ]; then
    WINDOW2="$(workspace 2)"
    WINDOW3="$(workspace 3)"
    LABEL="$WINDOW1 | $WINDOW2 | $WINDOW3"
  fi
  
  sketchybar --set aerospace_app label="$LABEL"
fi

# if [ "$SENDER" = "front_app_switched" ]; then
#   sketchybar --set $NAME label="$INFO" icon="$($CONFIG_DIR/plugins/icon_map_fn.sh "$INFO")"
# fi
