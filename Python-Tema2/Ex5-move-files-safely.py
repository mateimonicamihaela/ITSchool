#!/usr/bin/env python3

"""
Exercitiul 5:

Faceti un script de python ce muta unul cate unul fisierele dintr-un director în celalat
Dupa fiecare mutare de fisier scriptul doarme un numar random de secunde intre 1 si 5 (pentru a simula un long running process).
Directorul sursa este primul argument al scriptului iar destinatie al doilea.
Incercati sa porniti in acelasi timp 2 instante ale scriptului si verificati ca ambele functioneaza corect.

Hint:
    - os.makedirs(dest_dir, exist_ok=True)
    - src_path = os.path.join(source_dir, filename)
    - os.rename(src_path, lock_path)
    - time.sleep(random.randint(1, 5))
    - shutil.move(lock_path, dest_path)
"""


import os
import sys
import time
import random
import shutil
import logging

# Configurare logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s'
)

def move_files_one_by_one(source_dir, dest_dir):
    os.makedirs(dest_dir, exist_ok=True)

    for filename in os.listdir(source_dir):
        src_path = os.path.join(source_dir, filename)

        # Ignora directoare si fisiere deja blocate
        if not os.path.isfile(src_path) or filename.endswith(".lock"):
            continue

        # Creeaza un fisier de tip lock pentru a preveni accesul simultan
        lock_path = src_path + ".lock"
        try:
            os.rename(src_path, lock_path)
        except FileNotFoundError:
            continue  # Alt proces l-a mutat deja
        except OSError:
            continue  # Posibil lock de alt proces

        try:
            logging.info(f"Mutare fisier: {filename}")
            time.sleep(random.randint(1, 5))  # Simulare proces lung

            dest_path = os.path.join(dest_dir, filename)
            shutil.move(lock_path, dest_path)
            logging.info(f"Fisierul a fost mutat in: {dest_path}")
        except Exception as e:
            logging.error(f"Eroare la mutare: {e}")
            # Daca apare o eroare, refa numele fisierului original
            if os.path.exists(lock_path):
                os.rename(lock_path, src_path)

def main():
    if len(sys.argv) != 3:
        print("Usage: python3 move_files_safely.py <source_dir> <dest_dir>")
        sys.exit(1)

    source_dir = sys.argv[1]
    dest_dir = sys.argv[2]

    if not os.path.isdir(source_dir):
        logging.error(f"Directorul sursa nu exista: {source_dir}")
        sys.exit(1)

    move_files_one_by_one(source_dir, dest_dir)

if __name__ == "__main__":
    main()

