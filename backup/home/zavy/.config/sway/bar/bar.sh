#!/bin/sh

START_TIMESTAMP=$(date +%s)
PLUGINS="/home/zavy/.config/sway/bar"

while true; do

  BATTERY=$($PLUGINS/battery.sh "$START_TIMESTAMP")

  CLOCK=$($PLUGINS/clock.sh "$START_TIMESTAMP")
  
  WIFI=$($PLUGINS/wifi.sh "$START_TIMESTAMP")  

  echo "$BATTERY | $WIFI | $CLOCK"
    
  sleep 15

done
