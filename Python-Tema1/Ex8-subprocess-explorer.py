"""
Exercitiul 8:

Acesta este un exercitiu exploratory. Nu aveți ceva anume de făcut, ci sa explorati diferite
variante ale codului și să observați rezultatele. Mai jos aveți un script python care rulează o
comanda (de ping) folosind libraria subprocess.

subprocess este o librărie foarte puternica ce ne permite sa capturam inclusiv erorile și
outputul unei comenzi de system.

Rulați codul și apoi incercati să-l modificați astfel incat sa capturati și alte erori sau
outputuri. De exemplu, încercați sa rulati comanda de sistem ”ls” pe un director fără drepturi
de acces și vedeți cum se comporta programul.

import subprocess
try:
# Folosește subprocess pentru a executa comanda
result = subprocess.run(["ping", "-c", "1", "8.8.8.8"],capture_output=True, text=True, check=True)
print("Comanda a reușit!")
print("Ieșire:", result.stdout)
except subprocess.CalledProcessError as e:
print("Comanda a eșuat!")
print("Cod de eroare:", e.returncode)
print("Mesaj eroare:", e.stderr)

La final ar trebui sa aveți un tabel cu comenzile pe care le-ati incercat și ce erori au întors.
"""

import subprocess
try:
    # Folosește subprocess pentru a executa comanda
    result = subprocess.run(["ping", "-c", "1", "8.8.8.8"],capture_output=True, text=True, check=True) 
    #result = subprocess.run(["ping -c 1 8.8.8.8"],capture_output=True, text=True, check=True)
    #result = subprocess.Popen(["sleep", "999"])
    #result = subprocess.run(["ls", "-alh", "/home/alice"],capture_output=True, text=True, check=True) 
    print("Comanda a reușit!")
    print("Ieșire:", result.stdout)
except subprocess.CalledProcessError as e:
    print("Comanda a eșuat!")
    print("Cod de eroare:", e.returncode)
    print("Mesaj eroare:", e.stderr)