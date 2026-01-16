#!/bin/bash

# Exercițiu 8
# Scrieți un script de shell cu numele group-copy.sh care copiază userii dintr-un grup în altul.
# Scriptul primește 2 parametri obligatorii și diferiți: grupul sursă și grupul destinație (în această ordine).

# Validare: trebuie exact 2 argumente
if [ "$#" -ne 2 ]; then
  echo "Eroare: Scriptul trebuie apelat cu exact 2 argumente: grup_sursa și grup_destinatie." >&2
  echo "Exemplu: $0 developers testers" >&2
  exit 1
fi

GRUP_SURSA="$1"
GRUP_DESTINATIE="$2"

# Validare: grupurile trebuie să fie diferite
if [ "$GRUP_SURSA" == "$GRUP_DESTINATIE" ]; then
  echo "Eroare: Grupul sursă și grupul destinație trebuie să fie diferite." >&2
  exit 2
fi

# Verificare existență grup sursă
if ! getent group "$GRUP_SURSA" > /dev/null; then
  echo "Eroare: Grupul sursă '$GRUP_SURSA' nu există." >&2
  exit 3
fi

# Verificare existență grup destinație
if ! getent group "$GRUP_DESTINATIE" > /dev/null; then
  echo "Eroare: Grupul destinație '$GRUP_DESTINATIE' nu există." >&2
  exit 4
fi

echo "Începem copierea utilizatorilor din grupul '$GRUP_SURSA' în grupul '$GRUP_DESTINATIE'..."

# Extragem utilizatorii din grupul sursă
USERI=$(getent group "$GRUP_SURSA" | cut -d: -f4 | tr ',' ' ')

if [ -z "$USERI" ]; then
  echo "Notă: Grupul sursă '$GRUP_SURSA' nu conține utilizatori." >&2
  exit 5
fi

# Iterăm prin utilizatori și îi adăugăm în grupul destinație
for user in $USERI; do
  echo "Adăugare utilizator '$user' în grupul '$GRUP_DESTINATIE'..."
  usermod -a -G "$GRUP_DESTINATIE" "$user"
  if [ "$?" -eq 0 ]; then
    echo "Utilizatorul '$user' a fost adăugat cu succes."
  else
    echo "Eroare la adăugarea utilizatorului '$user'." >&2
  fi
done

echo "Copierea s-a finalizat."

exit 0
