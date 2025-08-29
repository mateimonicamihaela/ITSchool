#!/bin/bash
# Exercițiul 7:
# Faceți un script de shell numit group-list.sh ce afișează toți userii ce se află într-un grup, separați prin spațiu.
# Scriptul primește ca argument obligatoriu numele grupului.
# Dacă nu este niciun user în grup, nu afișează nimic.
# Hint: Folosiți comanda similară:
# cat /etc/group | grep -e "sudo:" | awk -F':' '{print $4}' | tr ',' ' '

# Verificare argument
if [ $# -ne 1 ]; then
    echo "Eroare: Scriptul așteaptă exact un argument: numele grupului."
    echo "Utilizare: $0 <grup>"
    exit 1
fi

GRUP="$1"

# Extrage linia din /etc/group
LINIE=$(grep -E "^$GRUP:" /etc/group)

if [ -z "$LINIE" ]; then
    echo "Eroare: Grupul '$GRUP' nu există."
    exit 2
fi

# Extrage lista de useri (câmpul 4) și înlocuiește virgulele cu spații
USERI=$(echo "$LINIE" | awk -F':' '{print $4}' | tr ',' ' ')

# Afișează userii doar dacă lista nu e goală
if [ -n "$USERI" ]; then
    echo "$USERI"
fi

exit 0

