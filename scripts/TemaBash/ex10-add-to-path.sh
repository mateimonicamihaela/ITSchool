#!/bin/bash
# Exercitiul 10
# Adăugați în variabila de mediu PATH directorul cu calea ~/bin-itschools/ doar dacă acesta există.
# Faceți acest lucru în mod automat de fiecare dată când se pornește o sesiune cu login pentru userul curent.
# Adăugați un script în acel director și încercați să-l executați de oriunde.

TARGET_DIR="$HOME/bin-itschools"
BASHRC="$HOME/.bashrc"

echo "[INFO] Verific dacă $TARGET_DIR există..."
if [ -d "$TARGET_DIR" ]; then
    echo "[INFO] Directorul există."

    if ! grep -q "$TARGET_DIR" "$BASHRC"; then
        echo "[INFO] Adaug $TARGET_DIR în PATH în $BASHRC"
        echo "" >> "$BASHRC"
        echo "# Adăugat de scriptul exercitiului 10" >> "$BASHRC"
        echo "export PATH=\"\$PATH:$TARGET_DIR\"" >> "$BASHRC"
        echo "[INFO] Modificarea a fost făcută. Te rog să redeschizi terminalul sau să rulezi: source ~/.bashrc"
    else
        echo "[INFO] Directorul este deja în PATH."
    fi
else
    echo "[ERROR] Directorul $TARGET_DIR nu există. Nu se face nicio modificare." >&2
    exit 1
fi

exit 0
