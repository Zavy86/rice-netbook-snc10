#!/bin/sh

TEMP=$(sensors | grep 'Core 0' | awk '{print $3}' | tr -d '+°C' | awk '{printf("%.0f\n", $1)}')

if [ "$TEMP" -ge 30 ] || [ "$ELAPSED" -lt 99 ]; then
  echo " $TEMP"
else
  echo ""
fi
