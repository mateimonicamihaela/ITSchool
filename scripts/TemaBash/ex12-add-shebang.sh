#!/bin/bash


# Exercitiul 12:
# Scrieți un script care adaugă automat shebang-ul #!/bin/bash în fișierele .sh
# dintr-un director primit ca argument, doar dacă acesta nu este deja prezent.

# Verificare argument
if [ $# -ne 1 ]; then
    echo "Utilizare: $0 <cale_director>"
    exit 1
fi

TARGET_DIR="$1"

# Verificare dacă directorul există
if [ ! -d "$TARGET_DIR" ]; then
    echo "Eroare: Directorul $TARGET_DIR nu există."
    exit 2
fi

echo "Căutare fișiere .sh în $TARGET_DIR..."

# Iterează prin toate fișierele .sh din director (nu recursiv)
for file in "$TARGET_DIR"/*.sh; do
    # Verifică dacă fișierul există și e regulat
    if [ -f "$file" ]; then
        # Citește primul rând
        first_line=$(head -n 1 "$file")

        # Verifică dacă începe cu #!
        if [[ "$first_line" != \#!* ]]; then
            echo "Adaug shebang în $file"
            # Adaugă #!/bin/bash la începutul fișierului
            sed -i '1i #!/bin/bash' "$file"
        else
            echo "Shebang deja prezent în $file"
        fi
    fi
done

echo "Operațiune completă."
exit 0

