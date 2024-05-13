#!/bin/bash

WIDTH=100

volume_change() {
  source "$CONFIG_DIR/icons.sh"
  source "$CONFIG_DIR/colors.sh"

  case $INFO in
    [6-9][0-9]|100) ICON=$VOLUME_100
    ;;
    [3-5][0-9]) ICON=$VOLUME_66
    ;;
    [1-2][0-9]) ICON=$VOLUME_33
    ;;
    [1-9]) ICON=$VOLUME_10
    ;;
    0) ICON=$VOLUME_0
    ;;
    *) ICON=$VOLUME_100
  esac

  sketchy_bottombar --set volume_icon icon=$ICON
  sketchy_bottombar --set $NAME slider.percentage=$INFO --animate tanh 30 --set $NAME slider.width=$WIDTH 
  sleep 2

  # Check wether the volume was changed another time while sleeping
  FINAL_PERCENTAGE=$(sketchy_bottombar --query $NAME | jq -r ".slider.percentage")
  if (( FINAL_PERCENTAGE == INFO )); then
    sketchy_bottombar --animate tanh 30 --set $NAME slider.width=0
  fi
}

mouse_clicked() {
  osascript -e "set volume output volume $PERCENTAGE"
}

case "$SENDER" in
  "volume_change") volume_change
  ;;
  "mouse.clicked") mouse_clicked
  ;;
esac