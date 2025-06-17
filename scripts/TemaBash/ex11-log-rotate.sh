#!/bin/bash

#!/bin/bash
# Exercitiul 11:
# Faceți un script ce face log rotation la un fișier de loguri primit ca argument.
# Log rotation-ul se face automat la un număr de secunde primit ca argument.
# Se copiază fișierul curent într-un fișier nou cu timestamp, fișierul original se golește,
# iar copia se arhivează (.gz).

# Validare argumente
if [ "$#" -ne 2 ]; then
    echo "Utilizare: $0 <cale_fisier_log> <interval_rotatie_secunde>"
    exit 1
fi

LOG_FILE="$1"
INTERVAL="$2"

# Validare fișier
if [ ! -f "$LOG_FILE" ]; then
    echo "Eroare: Fisierul $LOG_FILE nu exista."
    exit 2
fi

# Validare că intervalul este un număr întreg
if ! [[ "$INTERVAL" =~ ^[0-9]+$ ]]; then
    echo "Eroare: Intervalul trebuie sa fie un număr întreg (secunde)."
    exit 3
fi

echo "Pornit log rotation pentru $LOG_FILE la fiecare $INTERVAL secunde..."

# Loop infinit
while true; do
    sleep "$INTERVAL"

    TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
    ROTATED_FILE="${LOG_FILE}.${TIMESTAMP}"

    # Copiază și golește logul
    cp "$LOG_FILE" "$ROTATED_FILE"
    : > "$LOG_FILE"

    # Arhivează copia
    gzip "$ROTATED_FILE"

    echo "[$(date)] Log rotit: $ROTATED_FILE.gz"
done

