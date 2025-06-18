#!/usr/bin/env python3
"""
Exercițiul 3:
Libraria sys îți permite sa citesti parametrii pasati ca argumente scriptului de python.
Acestia sunt tinuti automat in sys.argv.

Faceti un script in python care primește 2 parametrii: nume utilizator și varsta acestuia
1. Importa libraria sys
2. Dacă nu au fost pasati parametrii, aruncati o exceptie.
3. Dacă au fost pasati parametrii:
   a. printati mesajul “Au fost pasati <n> parametrii”.
   b. daca varsta este mai mare de 18 ani, creati un subdirector pe disk cu numele utilizatorului.
"""

import sys
import os

try:
    # Verificăm dacă s-au primit exact 2 argumente (excluding scriptul însuși)
    if len(sys.argv) != 3:
        raise ValueError("Trebuie să furnizezi exact 2 argumente: <nume_utilizator> <varsta>")

    nume = sys.argv[1]
    varsta_str = sys.argv[2]

    # Convertim varsta în int
    try:
        varsta = int(varsta_str)
    except ValueError:
        raise ValueError("Al doilea argument (vârsta) trebuie să fie un număr întreg.")

    print(f"Au fost pasati {len(sys.argv) - 1} parametri.")

    # Dacă varsta > 18, creăm director
    if varsta > 18:
        if not os.path.exists(nume):
            os.mkdir(nume)
            print(f"Directorul '{nume}' a fost creat.")
        else:
            print(f"Directorul '{nume}' există deja.")
    else:
        print("Utilizatorul este minor. Nu se creează director.")

except Exception as e:
    print(f"Eroare: {e}")
    sys.exit(1)
