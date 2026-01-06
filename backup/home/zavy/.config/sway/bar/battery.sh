#!/bin/sh

# check for battery
if [ ! -d "/sys/class/power_supply/BAT1" ]; then
  echo "NB!"
  exit 0
fi

STATUS=$(cat /sys/class/power_supply/BAT1/status)
CAPACITY=$(cat /sys/class/power_supply/BAT1/capacity)

if [ "$STATUS" = "Charging" ]; then
  ICON=""
else
  if [ "$CAPACITY" -ge 90 ]; then
    ICON=""
  elif [ "$CAPACITY" -ge 60 ]; then
    ICON=""
  elif [ "$CAPACITY" -ge 40 ]; then
    ICON=""
  elif [ "$CAPACITY" -ge 20 ]; then
    ICON=""
  else
    ICON=""
  fi
fi

SHOW_PERCENTAGE=false
if [ "$STATUS" = "Charging" ] || [ "$CAPACITY" -lt 40 ]; then
  SHOW_PERCENTAGE=true
fi

if [ "$SHOW_PERCENTAGE" = true ]; then
  echo "$ICON $CAPACITY%"
else
  echo "$ICON"
fi
