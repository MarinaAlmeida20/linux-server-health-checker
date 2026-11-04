#!/bin/bash

echo "===================================="
echo "       LINUX SERVER HEALTH CHECK"
echo "===================================="

echo ""
echo "SYSTEM INFORMATION"
echo "------------------------------------"

hostname
uptime

echo ""
echo "MEMORY INFORMATION"
echo "------------------------------------"

free -h

MEMORY_AVAILABLE=$(free | awk '/Mem:/ {printf "%.0f", $7/$2*100}')

if [ "$MEMORY_AVAILABLE" -lt 10 ]; then
    echo "CRITICAL: Only ${MEMORY_AVAILABLE}% memory available"
elif [ "$MEMORY_AVAILABLE" -lt 20 ]; then
    echo "WARNING: Only ${MEMORY_AVAILABLE}% memory available"
else
    echo "OK: ${MEMORY_AVAILABLE}% memory available"
fi

echo ""
echo "DISK INFORMATION"
echo "------------------------------------"

df -h /

DISK_USAGE=$(df -P / | awk 'NR==2 {print $5}' | tr -d '%')

if [ "$DISK_USAGE" -ge 90 ]; then
    echo "CRITICAL: Disk usage is ${DISK_USAGE}%"
elif [ "$DISK_USAGE" -ge 80 ]; then
    echo "WARNING: Disk usage is ${DISK_USAGE}%"
else
    echo "OK: Disk usage is ${DISK_USAGE}%"
fi

echo ""
echo "TOP CPU PROCESSES"
echo "------------------------------------"

ps aux --sort=-%cpu | head -6

echo ""
echo "TOP MEMORY PROCESSES"
echo "------------------------------------"

ps aux --sort=-%mem | head -6

echo ""
echo "SERVICE CHECK"
echo "------------------------------------"

SERVICE_STATUS=$(systemctl is-active cron)

if [ "$SERVICE_STATUS" = "active" ]; then
    echo "OK: cron service is running"
else
    echo "CRITICAL: cron service is $SERVICE_STATUS"
fi

echo ""
echo "FAILED SERVICES CHECK"
echo "------------------------------------"

FAILED_SERVICES=$(systemctl --failed --type=service --no-legend --no-pager)

if [ -z "$FAILED_SERVICES" ]; then
    echo "OK: No failed services"
else
    echo "CRITICAL: Failed services detected"
    echo "$FAILED_SERVICES"
fi

echo ""
echo "HEALTH CHECK FINISHED"
echo "===================================="
