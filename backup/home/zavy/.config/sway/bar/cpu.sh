#!/bin/sh

START_TIMESTAMP=$1
CURRENT_TIMESTAMP=$(date +%s)
ELAPSED=$((CURRENT_TIMESTAMP - START_TIMESTAMP))

#CPU_LOAD=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5); printf "%.0f", usage}')

read cpu user nice system idle iowait irq softirq steal guest < /proc/stat
total_idle1=$idle
total1=$((user + nice + system + idle + iowait + irq + softirq + steal))

# Aspetta 1 secondo
sleep 1

# Secondo campionamento
read cpu user nice system idle iowait irq softirq steal guest < /proc/stat
total_idle2=$idle
total2=$((user + nice + system + idle + iowait + irq + softirq + steal))

# Calcola le differenze
diff_idle=$((total_idle2 - total_idle1))
diff_total=$((total2 - total1))
CPU_USAGE=$((100 * (diff_total - diff_idle) / diff_total))

if [ "$CPU_USAGE" -ge 50 ] || [ "$ELAPSED" -lt 99 ]; then
  echo " $CPU_USAGE%"
else
  echo ""
fi
