#!/bin/bash
echo "=========================================="
echo "         STOPPING CIVICAI"
echo "=========================================="
PIDS=$(pgrep -f "[n]ode.*vite")
if [ -n "$PIDS" ]; then
    echo "$PIDS" | xargs kill
    echo "CivicAI server stopped."
else
    echo "No CivicAI Vite server found running."
fi
