#!/bin/bash

# Exercițiul 2:
# Faceți un script ce compară dacă 2 fișiere (primite ca argument) sunt identice ca și conținut (folosind sha256sum).
# Bonus (dificultate ridicată): În loc de 2 fișiere, comparați o listă de oricât de multe fișiere.
# Dacă oricare 2 fișiere din listă sunt diferite, întoarceți un mesaj de eroare.

# ===================== VALIDARE ARGUMENTE =====================
if [ "$#" -lt 2 ]; then
    echo "[ERROR] Trebuie să furnizezi cel puțin două fișiere pentru comparație."
    echo "Utilizare: $0 fisier1 fisier2 [fisier3 ... fisierN]"
    exit 1
fi

# ===================== VALIDARE EXISTENȚĂ FIȘIERE =====================
for file in "$@"; do
    if [ ! -f "$file" ]; then
        echo "[ERROR] Fișierul '$file' nu există sau nu este un fișier obișnuit."
        exit 2
    fi
done

# ===================== CALCUL HASH + COMPARAȚIE =====================
declare -A hashes

echo "[INFO] Comparăm conținutul fișierelor folosind sha256sum..."

for file in "$@"; do
    hash=$(sha256sum "$file" | awk '{ print $1 }')
    hashes["$file"]=$hash
    echo "[INFO] $file => $hash"
done

# Comparăm fiecare hash cu primul
first_hash=${hashes["$1"]}

for file in "${!hashes[@]}"; do
    if [[ "${hashes[$file]}" != "$first_hash" ]]; then
        echo "[ERROR] Fișierele NU sunt identice!"
        exit 3
    fi
done

echo "[SUCCESS] Toate fișierele sunt identice."
exit 0

