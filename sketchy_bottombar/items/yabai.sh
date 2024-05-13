#!/bin/bash

yabai=(
  icon=$YABAI_GRID
  label.drawing=off
  script="$PLUGIN_DIR/yabai.sh"
  icon.font="$FONT:Bold:12.0"
)

# Allows my shortcut / workflow in Alfred to trigger things in sketchy_bottombar
sketchy_bottombar --add event alfred_trigger
sketchy_bottombar --add event update_yabai_icon

sketchy_bottombar --add item yabai left                   \
           --set yabai "${yabai[@]}"               \
           --subscribe yabai space_change          \
                             mouse.scrolled.global \
                             mouse.clicked         \
                             front_app_switched    \
                             space_windows_change  \
                             alfred_trigger        \
                             update_yabai_icon