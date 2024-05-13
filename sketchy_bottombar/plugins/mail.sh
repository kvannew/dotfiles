#!/usr/bin/env bash

TEXT=$(lsappinfo info -only StatusLabel "Mail" | grep -o '"label"="[0-9]*"' | awk -F'"' '{print $4}')

if [[ $TEXT -gt 0 ]]; then
  sketchy_bottombar -m --set $NAME drawing=on label="$TEXT"
else
  sketchy_bottombar -m --set $NAME drawing=off
fi