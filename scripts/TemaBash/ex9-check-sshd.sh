#!/bin/bash

# Exercițiul 9
# Scriptul verifică dacă serviciul sshd este oprit și îl repornește automat dacă este cazul.

SERVICE_NAME="ssh"

# Verificare dacă serviciul este activ
if systemctl is-active --quiet "$SERVICE_NAME"; then
    echo "[$(date)] Serviciul '$SERVICE_NAME' rulează normal."
else
    echo "[$(date)] Serviciul '$SERVICE_NAME' este oprit. Încercăm repornirea..."
    systemctl restart "$SERVICE_NAME"

    if systemctl is-active --quiet "$SERVICE_NAME"; then
        echo "[$(date)] Serviciul '$SERVICE_NAME' a fost repornit cu succes."
    else
        echo "[$(date)] Eroare: serviciul '$SERVICE_NAME' NU a putut fi repornit." >&2
    fi
fi

