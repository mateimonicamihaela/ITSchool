#!/bin/bash

# Exercițiul 1:
# Faceți un script ce așteaptă (la nesfârșit) după un fișier pe disk să fie creat (ce fișier doriți).
# După ce fișierul a fost creat, scriptul afișează un mesaj și iese cu succes.

# Bonus: Modificați scriptul să nu aștepte la nesfârșit, ci maxim 1 minut.
# Dacă fișierul este creat mai devreme de 1 minut, scriptul trebuie să se termine mai devreme.

# ====================== CONFIG ========================
TARGET_FILE="fisier_de_test.txt"

TIMEOUT_SECONDS=60   # Bonus - limita de așteptare
# ======================================================

echo "[INFO] Scriptul a pornit. Se va verifica dacă fișierul '$TARGET_FILE' a fost creat."
start_time=$(date +%s)


while true; do
    if [[ -f "$TARGET_FILE" ]]; then
        echo "[SUCCESS] Fișierul '$TARGET_FILE' a fost detectat!"
        exit 0
    fi

    current_time=$(date +%s)
    elapsed=$((current_time - start_time))

    if (( elapsed >= TIMEOUT_SECONDS )); then
        echo "[ERROR] Timpul de așteptare de $TIMEOUT_SECONDS secunde a expirat. Fișierul nu a fost găsit."
        exit 1
    fi

    echo "[INFO] Fișierul nu există încă. Trec ${elapsed} secunde..."
    sleep 1
done

