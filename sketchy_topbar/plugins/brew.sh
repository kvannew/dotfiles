#!/usr/bin/env sh

source "$HOME/.config/sketchy_topbar/colors.sh"

COUNT=$(brew outdated | wc -l | tr -d ' ')

COLOR=$RED

case "$COUNT" in
  [3-5][0-9]) COLOR=$ORANGE
  ;;
  [1-2][0-9]) COLOR=$YELLOW
  ;;
  [1-9]) COLOR=$WHITE
  ;;
  0) COLOR=$GREEN
     COUNT=􀆅
  ;;
esac

sketchy_topbar --set $NAME label=$COUNT icon.color=$COLOR
