"""
Exercițiul 5:
Pornind de la un fișier text numit logs.txt în care sunt stocate mesaje de log de la mai
multe servere, fiecare mesaj pe o linie, vrem să identificăm toate liniile care conțin cuvântul
ERROR și să le afisam împreună cu numărul liniei.
1. Folosește o buclă for pentru a parcurge fiecare linie din fișier.
2. Verifică dacă linia conține cuvântul ERROR.
3. Afișează linia și numărul acesteia dacă conține ERROR.

# logs.txt
INFO: Server started successfully.
WARNING: Disk space low.
ERROR: Unable to connect to database.
INFO: Scheduled backup completed.
ERROR: Failed to send email.
"""


# Deschidem fisierul logs.txt pentru citire
with open("logs.txt", "r") as f:
    # Parcurgem fiecare linie cu numarul ei (incepand de la 1)
    for line_number, line in enumerate(f, start=1):
        # Verificam daca linia contine cuvantul "ERROR"
        if "ERROR" in line:
            # Afisam numarul liniei si continutul liniei
            print(f"Linia {line_number}: {line.strip()}")
