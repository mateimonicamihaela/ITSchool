

#!/bin/bash
# Exercitiul 13:
# Parsează variabila PATH și pune într-un array toate căile.
# Iterează cu un for pe acest array de căi și pentru fiecare cale:
# - caută dacă acea cale conține un fișier executabil cu numele primit ca argument la script (ex: ./which.sh ls)
# - afișează toate căile ce conțin acel executabil.
# Dacă nu s-a găsit nicio cale, afișează un mesaj de eroare și termină scriptul cu un cod de eroare.

# Verificare argument
if [ $# -ne 1 ]; then
    echo "Utilizare: $0 <nume_executabil>"
    exit 1
fi

EXEC_NAME="$1"
FOUND=0

# Sparge PATH în array pe baza caracterului :
IFS=':' read -ra PATH_ARRAY <<< "$PATH"

# Iterare prin fiecare director din PATH
for dir in "${PATH_ARRAY[@]}"; do
    if [ -x "$dir/$EXEC_NAME" ]; then
        echo "Executabil găsit în: $dir/$EXEC_NAME"
        FOUND=1
    fi
done

if [ $FOUND -eq 0 ]; then
    echo "Eroare: Nu s-a găsit niciun executabil '$EXEC_NAME' în PATH." >&2
    exit 2
fi

exit 0

