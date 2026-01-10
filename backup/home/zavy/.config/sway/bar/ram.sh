#!/bin/sh

START_TIMESTAMP=$1
CURRENT_TIMESTAMP=$(date +%s)
ELAPSED=$((CURRENT_TIMESTAMP - START_TIMESTAMP))

TOTAL_MEM=$(free -b | grep Mem: | awk '{print $2}')
USED_MEM=$(free -b | grep Mem: | awk '{print $3}')
PERCENTAGE=$(awk "BEGIN {printf \"%.0f\", ($USED_MEM/$TOTAL_MEM)*100}")
if [ "$PERCENTAGE" -ge 50 ] || [ "$ELAPSED" -lt 99 ]; then
  echo " $PERCENTAGE%"
else
  echo ""
fi
