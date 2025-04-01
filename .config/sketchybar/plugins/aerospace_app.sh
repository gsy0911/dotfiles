#!/bin/sh

# Some events send additional information specific to the event in the $INFO
# variable. E.g. the front_app_switched event sends the name of the newly
# focused application in the $INFO variable:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

function window() {
  # $1 = workspace-id
  if [[ $1 ]]; then
    if [[ "$1" -ge 1 && "$1" -le 9 ]]; then
      local window="$(aerospace list-windows --workspace "$1" --format "%{app-name}" | uniq | paste -s -d "," -)"
      echo "$1:$window"
    else
      echo "$1"
    fi
  fi
}

function listWindowsVisibleNo() {
  # $1 = monitor-id
  if [[ $1 ]]; then
    local workspaces="$(aerospace list-workspaces --monitor $1 --visible no --empty no)"
    for workspaceId in $workspaces
    do
      echo "$(window "$workspaceId")"
    done
  fi
}

function workspace() {
  # $1 = monitor-id
  if [[ $1 ]]; then
    local workspace="$(aerospace list-workspaces --monitor $1 --visible)"
    # local workspace_non="$(aerospace list-workspaces --monitor $1 --visible no --empty no | paste -s -d ',' -)"
    local workspaceWithName="$(listWindowsVisibleNo $1 | paste -s -d ',' -)"
    local label="$workspace ($workspaceWithName)"
    echo $label
  fi
}

if [ "$SENDER" = "front_app_switched" ]; then
  MONITOR_NUM="$(aerospace list-monitors --count)"
  if [ "$MONITOR_NUM" = "4" ]; then
    WINDOW1="$(workspace 1)"
    WINDOW2="$(workspace 2)"
    WINDOW3="$(workspace 3)"
    WINDOW4="$(workspace 4)"
    LABEL="$WINDOW1 | $WINDOW2 | $WINDOW3 | $WINDOW4"
  elif [ "$MONITOR_NUM" = "3" ]; then
    WINDOW1="$(workspace 1)"
    WINDOW2="$(workspace 2)"
    WINDOW3="$(workspace 3)"
    LABEL="$WINDOW1 | $WINDOW2 | $WINDOW3"
  elif [ "$MONITOR_NUM" = 2 ]; then
    WINDOW1="$(workspace 1)"
    WINDOW2="$(workspace 2)"
    LABEL="$WINDOW1 | $WINDOW2"
  elif [ "$MONITOR_NUM" = 1 ]; then
    WINDOW1="$(workspace 1)"
    LABEL="$WINDOW1"
  else
    LABEL="-"
  fi
  
  sketchybar --set aerospace_app label="$LABEL"
fi

# if [ "$SENDER" = "front_app_switched" ]; then
#   sketchybar --set $NAME label="$INFO" icon="$($CONFIG_DIR/plugins/icon_map_fn.sh "$INFO")"
# fi
