#!/bin/bash
echo "======================================================="
echo "            CIVICAI SYSTEM STATUS"
echo "======================================================="
echo ""
echo "Current Date and Time:"
date
echo ""
echo "Current User:"
whoami
echo ""
echo "Disk Usage:"
df -h /
echo ""
echo "Memory Usage:"
free -h
echo ""
echo "CivicAI Application Status:"
if pgrep -f "vite" > /dev/null; then
    echo "CivicAI development server is RUNNING."
else
    echo "CivicAI development server is NOT running."
fi
echo ""
echo "System status check completed."
