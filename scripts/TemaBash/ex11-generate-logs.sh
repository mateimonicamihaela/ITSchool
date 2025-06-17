#!/bin/bash
# Script de test: Scrie la nesfârșit mesaje în log (pentru testarea log rotation)

LOG_FILE="$1"

if [ -z "$LOG_FILE" ]; then
    echo "Utilizare: $0 <cale_fisier_log>"
    exit 1
fi

echo "Scriere continuă în $LOG_FILE ..."

# Loop infinit de scriere în log
while true; do
    echo "[$(date)] Mesaj de test log rotation" >> "$LOG_FILE"
    sleep 1
done

