#!/usr/bin/env bash

# VPN=$(scutil --nc list | grep Connected | sed -E 's/.*"(.*)".*/\1/')

VPN_STATUS=$(/usr/local/bin/piactl get connectionstate)

if [[ "$VPN_STATUS" == "Connected" ]]; then
  sketchy_bottombar --set $NAME icon=􀎡 drawing=on
else
  sketchy_bottombar --set $NAME drawing=off
fi