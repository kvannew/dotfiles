#!/bin/bash

# Some events send additional information specific to the event in the $INFO
# variable. E.g. the front_app_switched event sends the name of the newly
# focused application in the $INFO variable:
# https://felixkratz.github.io/sketchy_bottombar/config/events#events-and-scripting

if [ "$SENDER" = "front_app_switched" ]; then
  sketchy_bottombar --set $NAME label="$INFO" # icon.background.image="app.$INFO"
fi