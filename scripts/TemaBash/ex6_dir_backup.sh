

#!/bin/bash
# Exercițiul 6:
# Faceți un script ce face backup la fiecare 5 secunde la un director (doar la fișierele ce s-au modificat din acel director).
# Scriptul primește ca argument numele directorului la care trebuie făcut backup.
# Frecvența la care se face backup este citită dintr-o variabilă de mediu FRECVENTA_BACKUP (valoare implicită: 5 secunde).
# Se folosește sha256sum pentru a verifica modificările.

# --- Validare argumente ---
if [ $# -ne 1 ]; then
    echo "Eroare: Scriptul așteaptă exact un argument: calea către directorul ce trebuie monitorizat."
    echo "Utilizare: $0 /cale/catre/director"
    exit 1
fi

SOURCE_DIR="$1"

if [ ! -d "$SOURCE_DIR" ]; then
    echo "Eroare: Directorul '$SOURCE_DIR' nu există sau nu este un director valid."
    exit 2
fi

# Frecvența de backup (secunde)
FRECVENTA_BACKUP="${FRECVENTA_BACKUP:-5}"

# Directorul în care se salvează backupurile
BACKUP_DIR="backup_dir"
mkdir -p "$BACKUP_DIR"

# Fișier temporar pentru hash-uri anterioare
HASH_STORE=".last_hashes"

declare -A last_hashes

# Citim hash-urile anterioare dacă fișierul există
if [ -f "$HASH_STORE" ]; then
    while IFS= read -r line; do
        filepath="${line%% *}"
        hash="${line##* }"
        last_hashes["$filepath"]="$hash"
    done < "$HASH_STORE"
fi

echo "Monitorizăm directorul '$SOURCE_DIR' la fiecare $FRECVENTA_BACKUP secunde..."
echo "Backupurile vor fi salvate în '$BACKUP_DIR'."

while true; do
    TIMESTAMP=$(date +"%Y-%m-%d-%H-%M-%S")

    find "$SOURCE_DIR" -type f | while read -r file; do
        REL_PATH="${file#$SOURCE_DIR/}"  # cale relativă
        CURRENT_HASH=$(sha256sum "$file" | awk '{print $1}')
        LAST_HASH="${last_hashes[$REL_PATH]}"

        if [ "$CURRENT_HASH" != "$LAST_HASH" ]; then
            # Fișier modificat, facem backup
            DEST_PATH="$BACKUP_DIR/${REL_PATH}_$TIMESTAMP"
            DEST_DIR=$(dirname "$DEST_PATH")
            mkdir -p "$DEST_DIR"
            cp "$file" "$DEST_PATH"
            echo "Backup efectuat pentru $REL_PATH → $DEST_PATH"

            # Actualizăm hash-ul
            last_hashes["$REL_PATH"]="$CURRENT_HASH"
        fi
    done

    # Salvăm hash-urile curente
    > "$HASH_STORE"
    for path in "${!last_hashes[@]}"; do
        echo "$path ${last_hashes[$path]}" >> "$HASH_STORE"
    done

    sleep "$FRECVENTA_BACKUP"
done

