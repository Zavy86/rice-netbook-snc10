#!/bin/sh

START_TIMESTAMP=$(date +%s)
PLUGINS="/home/zavy/.config/sway/bar"

while true; do

  BATTERY=$($PLUGINS/battery.sh "$START_TIMESTAMP")
  
  CLOCK=$($PLUGINS/clock.sh "$START_TIMESTAMP")

  CPU=$($PLUGINS/cpu.sh "$START_TIMESTAMP")
  
  RAM=$($PLUGINS/ram.sh "$START_TIMESTAMP")
  
  TEMPERATURE=$($PLUGINS/temperature.sh "$START_TIMESTAMP")

  WIFI=$($PLUGINS/wifi.sh "$START_TIMESTAMP")  

  echo "$TEMPERATURE | $CPU | $RAM | $BATTERY | $WIFI | $CLOCK"
    
  sleep 5

done
