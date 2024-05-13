#!/bin/bash

PLAYER_STATE="$(echo "$INFO" | jq -r '.state')"
CURRENT_ARTIST="$(echo "$INFO" | jq -r '.artist')"
CURRENT_SONG="$(echo "$INFO" | jq -r '.title')"

if [ "$PLAYER_STATE" = "playing" ]; then
  sketchy_bottombar --set $NAME drawing=on label="$CURRENT_ARTIST: $CURRENT_SONG"
else
  sketchy_bottombar --set $NAME drawing=off
fi