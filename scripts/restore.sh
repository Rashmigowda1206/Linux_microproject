#!/bin/bash
BACKUP_DIR="$HOME/Linux-Administration/linux-admin-microproject/backups"
PROJECT_DIR="$HOME/Linux-Administration/civicai"

echo "=================================="
echo "       CIVICAI RESTORE"
echo "=================================="

LATEST_BACKUP=$(ls -t "$BACKUP_DIR"/civicai_backup_*.tar.gz 2>/dev/null | head -n 1)

if [ -z "$LATEST_BACKUP" ]; then
    echo "Error: No backup file found!"
    exit 1
fi

echo "Latest backup found: $LATEST_BACKUP"
echo "Checking backup archive integrity..."

if tar -tzf "$LATEST_BACKUP" > /dev/null 2>&1; then
    echo "SUCCESS: Backup archive is valid and intact."
    FILE_COUNT=$(tar -tzf "$LATEST_BACKUP" | wc -l)
    echo "Files in backup: $FILE_COUNT"
else
    echo "Error: Backup archive is invalid!"
    exit 1
fi

echo ""
echo "Restore script completed. Archive verified successfully."
echo "Note: Automatic file replacement is disabled for safety."
