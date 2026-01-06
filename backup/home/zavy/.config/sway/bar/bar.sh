#!/bin/sh

START_TIMESTAMP=$(date +%s)
PLUGINS="/home/zavy/.config/sway/bar"

while true; do

  CLOCK=$($PLUGINS/clock.sh "$START_TIMESTAMP")
    
  BATTERY=$($PLUGINS/battery.sh)

  echo "$BATTERY | $CLOCK"
    
  sleep 15

done
