#!/usr/bin/env python3
"""
Exercitiul 2:
Scrieti un program in python care:
1. Citește parola introdusă de utilizator cu input()
2. Compară cu valoarea din variabila de mediu PAROLA_SECRETA
3. Afișează un mesaj în funcție de rezultat
4. Rulați programul cu mai multe valori și verificati ca face ce trebuie.
"""

import os

# 1. Citim parola introdusă de utilizator
parola = input("Introduceți parola: ")

# 2. Citim valoarea variabilei de mediu PAROLA_SECRETA
parola_secreta = os.getenv("PAROLA_SECRETA")

# 3. Verificare și afișare rezultat
if parola == parola_secreta:
    print("Parola corectă")
else:
    print("Parolă greșită")