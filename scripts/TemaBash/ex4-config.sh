#!/bin/bash

# Exercițiul 4:
# Script ce încarcă variabilele de mediu dintr-un fișier config.txt cu formatul:
# VARIABILA:valoare
# Bonus:
# - Setează doar dacă variabilele nu sunt deja definite
# - Cum le facem disponibile în sesiunea shell-ului curent?
# - Cum le facem disponibile la fiecare pornire a terminalului?

CONFIG_FILE="config.txt"

if [ ! -f "$CONFIG_FILE" ]; then
    echo "[ERROR] Fișierul '$CONFIG_FILE' nu există."
    exit 1
fi

echo "[INFO] Încarc variabilele din $CONFIG_FILE..."

while IFS=: read -r key value; do
    # Ignoră linii goale sau comentarii
    [[ -z "$key" || "$key" =~ ^# ]] && continue

    # Elimină spațiile din jur
    key=$(echo "$key" | xargs)
    value=$(echo "$value" | xargs)

    # Verifică dacă variabila e deja setată în shell
    if [ -z "${!key}" ]; then
        export "$key=$value"
        echo "[INFO] Setez $key=$value"
    else
        echo "[INFO] Variabila $key este deja setată. O păstrez cu valoarea existentă (${!key})."
    fi
done < "$CONFIG_FILE"

