#!/usr/bin/env python3

"""
Exercitiul 7:

Faceti un script de python care primeste ca argument un string base64 si un nume de fisier. 
Scriptul o sa creeze pe disk un fisier cu numele primit ca argument si o sa ii puna ca si continut stringul decodat din base64.
Testati scriptul.

"""


import sys
import base64
import logging

# Configurare logging
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s"
)

def decode_base64_to_file(b64_string, filename):
    try:
        decoded_bytes = base64.b64decode(b64_string.encode("utf-8"))
        with open(filename, "wb") as f:
            f.write(decoded_bytes)
        logging.info(f"Fisierul a fost creat: {filename}")
    except Exception as e:
        logging.error(f"Eroare la decodare sau scriere fisier: {e}")

def main():
    if len(sys.argv) != 3:
        print("Usage: python3 decode_base64_to_file.py <base64_string> <output_filename>")
        sys.exit(1)

    b64_string = sys.argv[1]
    filename = sys.argv[2]

    decode_base64_to_file(b64_string, filename)

if __name__ == "__main__":
    main()

