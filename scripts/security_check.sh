#!/bin/bash
PROJECT_DIR="$HOME/Linux-Administration/linux-admin-microproject"

echo "===================================="
echo "     LINUX SECURITY CHECK"
echo "===================================="
echo ""
echo "1. Checking script permissions..."
for file in "$PROJECT_DIR"/scripts/*.sh; do
    if [ -x "$file" ]; then
        echo "  PASS: $(basename "$file") is executable"
    else
        echo "  WARNING: $(basename "$file") is NOT executable"
    fi
done

echo ""
echo "2. Checking project directories..."
for dir in scripts config logs backups tests; do
    if [ -d "$PROJECT_DIR/$dir" ]; then
        echo "  PASS: $dir/ directory exists"
    else
        echo "  WARNING: $dir/ directory is MISSING"
    fi
done

echo ""
echo "3. Checking config file..."
if [ -f "$PROJECT_DIR/config/project.conf" ]; then
    echo "  PASS: project.conf exists"
else
    echo "  WARNING: project.conf is missing"
fi

echo ""
echo "4. Checking for world-writable files in project..."
WORLDWRITE=$(find "$PROJECT_DIR" -perm -o+w -not -type d 2>/dev/null | wc -l)
if [ "$WORLDWRITE" -eq 0 ]; then
    echo "  PASS: No world-writable files found"
else
    echo "  WARNING: $WORLDWRITE world-writable file(s) found"
fi

echo ""
echo "Security check completed."
