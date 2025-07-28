#!/usr/bin/env python3

"""
Exercitiul 6:

Faceti un modul de utils (sau adaugati in modulul creat la exercitiile precedente) in care adaugati 2 metode:
una care face encode base64 la un text si alta care face decode base64 la text. 
Testati aceste metode de utils dintr-un alt script de python.
"""


import logging
from my_utils import encode_base64, decode_base64

# Configurare logging
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s"
)

def main():
    original_text = "parola123"
    encoded = encode_base64(original_text)
    decoded = decode_base64(encoded)

    logging.info(f"Text original: {original_text}")
    logging.info(f"Text codificat (Base64): {encoded}")
    logging.info(f"Text decodificat (Base64): {decoded}")

    assert original_text == decoded, "Eroare: Textul decodificat nu corespunde celui original!"

if __name__ == "__main__":
    main()


