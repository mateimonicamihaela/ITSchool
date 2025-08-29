#!/bin/bash

# Exercițiul 3:
# Scrieți un script care verifică dacă un site este disponibil (status code între 200 și 399).
# Scriptul verifică de un număr maxim de ori primit tot ca argument.
# Hint: Comanda pentru a citi doar status code-ul este:
# curl -o /dev/null -s -w "%{http_code}\n" https://example.com

# ===================== VALIDARE ARGUMENTE =====================
if [ "$#" -ne 2 ]; then
    echo "[ERROR] Utilizare: $0 <URL> <max_incarcari>"
    exit 1
fi

URL="$1"
MAX_TRIES="$2"

if ! [[ "$MAX_TRIES" =~ ^[0-9]+$ ]]; then
    echo "[ERROR] Al doilea argument trebuie să fie un număr întreg."
    exit 2
fi

# ===================== LOOP DE VERIFICARE =====================
try=1
while [ "$try" -le "$MAX_TRIES" ]; do
    echo "[INFO] Încercare $try din $MAX_TRIES pentru URL: $URL"

    status_code=$(curl -o /dev/null -s -w "%{http_code}" "$URL")

    echo "[INFO] Cod răspuns: $status_code"

    if [[ "$status_code" -ge 200 && "$status_code" -lt 400 ]]; then
        echo "[SUCCESS] Site-ul este disponibil!"
        exit 0
    fi

    try=$((try + 1))
    sleep 2
done

echo "[ERROR] Site-ul NU este disponibil după $MAX_TRIES încercări."
exit 3

