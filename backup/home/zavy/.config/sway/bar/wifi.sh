#!/bin/sh

INTERFACE="wlan0"
START_TIMESTAMP=$1
CURRENT_TIMESTAMP=$(date +%s)
ELAPSED=$((CURRENT_TIMESTAMP - START_TIMESTAMP))


# Prova a leggere lo stato operativo (up/down)
OPERSTATE=$(cat /sys/class/net/"$INTERFACE"/operstate 2>/dev/null)

if [ "$OPERSTATE" = "up" ]; then

  SSID=$(iw dev "$INTERFACE" link | grep "SSID" | awk '{print $2}')

  if [ "$ELAPSED" -lt 99 ]; then
    echo " $SSID" 
  else
    echo ""
  fi

fi
