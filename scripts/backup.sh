#!/bin/bash
PROJECT_DIR="$HOME/Linux-Administration/civicai"
BACKUP_DIR="$HOME/Linux-Administration/linux-admin-microproject/backups"

echo "====================================="
echo "       CIVICAI BACKUP"
echo "====================================="
echo "Starting CivicAI backup..."

if [ ! -d "$PROJECT_DIR" ]; then
    echo "Error: Project directory not found!"
    exit 1
fi

mkdir -p "$BACKUP_DIR"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="$BACKUP_DIR/civicai_backup_$TIMESTAMP.tar.gz"

if tar --exclude=node_modules --exclude=dist \
    -czf "$BACKUP_FILE" -C "$PROJECT_DIR" .; then
    echo "Backup successful!"
    echo "Saved to: $BACKUP_FILE"
    SIZE=$(du -sh "$BACKUP_FILE" | cut -f1)
    echo "Backup size: $SIZE"
else
    echo "Backup failed!"
    exit 1
fi
