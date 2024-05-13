#!/bin/bash

# Load global styles, colors and icons
source "$CONFIG_DIR/globalstyles.sh"

# Defaults
spaces=(
  background.height=22
  background.corner_radius=20
  icon.padding_left=10
  icon.padding_right=10
  label.padding_right=4
)

# Get all spaces
SPACES=($(yabai -m query --spaces index | jq -r '.[].index'))

for SID in "${SPACES[@]}"; do
  sketchy_bottombar --add space space.$SID left   \
    --set space.$SID "${spaces[@]}"        \
    script="$PLUGIN_DIR/app_space.sh $SID" \
    associated_space=$SID                  \
    icon=$SID                              \
    --subscribe space.$SID mouse.clicked front_app_switched space_change update_yabai_icon space_windows_change
done