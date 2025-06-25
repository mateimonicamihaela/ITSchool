#!/usr/bin/env python3
"""
Exercitiul 2:
Scrieti un program in python care:
1. Citește o variabila cu numele "parola" introdusă de utilizator,folosind metoda input()
2. Verifica dacă variabila are aceeași valoare ca o variabila de mediu cu numele PAROLA_SECRETA
3. Dacă are aceeași valoare, printati “Parola corecta”, în caz contrar afișați parola greșită.
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
