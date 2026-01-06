#!/bin/sh

START_TIMESTAMP=$1
CURRENT_TIMESTAMP=$(date +%s)
ELAPSED=$((CURRENT_TIMESTAMP - START_TIMESTAMP))

if [ "$ELAPSED" -lt 90 ]; then
    date +'%A, %-d %b %Y - %H:%M'
else
    date +'%H:%M'
fi
