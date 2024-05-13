#!/usr/bin/env sh

WIDTH=100

volume_change() {
  INITIAL_WIDTH=$(sketchy_topbar --query $NAME | jq ".icon.width")
  if [ "$INITIAL_WIDTH" -eq "0" ]; then
    sketchy_topbar --animate tanh 30 --set $NAME width=$WIDTH icon.width=$INFO 
  else
    sketchy_topbar --set $NAME icon.width=$INFO width=$WIDTH
  fi

  sleep 2
  FINAL_WIDTH=$(sketchy_topbar --query $NAME | jq ".icon.width")
  if [ "$FINAL_WIDTH" -eq "$INFO" ]; then
    sketchy_topbar --animate tanh 30 --set $NAME width=0 icon.width=0
  fi
}

case "$SENDER" in
  "volume_change") volume_change
  ;;
esac
