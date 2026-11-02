#!/bin/bash
PROJECT_DIR="$HOME/Linux-Administration/civicai"
LOG_DIR="$HOME/Linux-Administration/linux-admin-microproject/logs"
echo "=========================================="
echo "         STARTING CIVICAI"
echo "=========================================="
if pgrep -f "vite" > /dev/null; then
    echo "CivicAI server is already running."
else
    mkdir -p "$LOG_DIR"
    cd "$PROJECT_DIR" || { echo "Error: Project directory not found!"; exit 1; }
    nohup npm run dev -- --host 0.0.0.0 > "$LOG_DIR/civicai.log" 2>&1 &
    echo "CivicAI server startup requested."
    echo "Check $LOG_DIR/civicai.log for details."
fi
