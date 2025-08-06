#!/usr/bin/env python3

"""
Exercitiul 2

Faceti un modul de utils in care adaugati 2 metode: una care face sha256 hash la un string si alta la un fisier.
Testati aceste metode de utils dintr-un alt script de python.
Hint:
    - hashlib.sha256(text.encode()).hexdigest()
    - hashlib.sha256(f.read()).hexdigest()

Bonus question:
Folositi libraria facuta de voi pentru a genera un sha256 hash pentru un fisier de pe disk si comparati-l cu valoarea obtinuta ruland comanda de linux sha256sum.
"""


import logging
from utils import hash_string_sha256, hash_file_sha256

# Configurare logging
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s"
)

def main():
    sample_text = "parola123"
    sample_file = "fisier_test.txt"

    # Test hash string
    hash_text = hash_string_sha256(sample_text)
    logging.info(f"SHA256 pentru textul '{sample_text}': {hash_text}")

    # Creare fisier de test (daca nu exista)
    with open(sample_file, "w") as f:
        f.write("Acesta este un fisier de test.")

    # Test hash fisier
    hash_file = hash_file_sha256(sample_file)
    if hash_file:
        logging.info(f"SHA256 pentru fisierul '{sample_file}': {hash_file}")
    else:
        logging.error(f"Fisierul '{sample_file}' nu a fost gasit.")

if __name__ == "__main__":
    main()

