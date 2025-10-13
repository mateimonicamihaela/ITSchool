#!/usr/bin/env python3

"""
Exercitiul 3

Faceti un script de python ce face backup la un fisier (doar daca acesta a fost modificat).
Calea catre fisierul la care face backup este primita ca argument.
Puneti scriptul de python in crontab sa ruleze automat la fiecare minut.

Hint:
    - hashlib.sha256(f.read()).hexdigest() (reutilizati metoda de la ex2)
    - os.listdir(backup_dir)
    - os.path.isfile(file_path)
    - timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    - shutil.copy2(file_path, backup_name)
"""



import os
import shutil
import argparse
from datetime import datetime
import logging
from utils import hash_file_sha256

# Configurare logging
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s"
)

def get_last_backup_hash(backup_dir):
    backups = sorted(os.listdir(backup_dir), reverse=True)
    for backup_file in backups:
        backup_path = os.path.join(backup_dir, backup_file)
        if os.path.isfile(backup_path):
            return hash_file_sha256(backup_path)
    return None

def main():
    parser = argparse.ArgumentParser(description="Script care face backup doar daca fisierul s-a modificat.")
    parser.add_argument("file_path", help="Calea catre fisierul de monitorizat")
    args = parser.parse_args()

    file_path = args.file_path

    if not os.path.isfile(file_path):
        logging.error(f"Fisierul '{file_path}' nu exista.")
        return

    current_hash = hash_file_sha256(file_path)
    if current_hash is None:
        logging.error("Nu s-a putut calcula hash-ul fisierului.")
        return

    backup_dir = "backups"
    os.makedirs(backup_dir, exist_ok=True)

    last_backup_hash = get_last_backup_hash(backup_dir)

    if current_hash != last_backup_hash:
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        filename = os.path.basename(file_path)
        backup_name = f"{filename}_{timestamp}"
        backup_path = os.path.join(backup_dir, backup_name)

        shutil.copy2(file_path, backup_path)
        logging.info(f"Backup creat: {backup_path}")
    else:
        logging.info("Fisierul nu s-a modificat. Nu s-a facut backup.")

if __name__ == "__main__":
    main()

