#!/usr/bin/env python3

"""
Exercitiul 4:

Faceti un script de python ce verifica daca nivelul de ocupare al discului este mai mare de un prag (configurable printr-o variabila de mediu - implicit 90%).
In cazul în care ocuparea discului este mai mare de acest prag printeaza un mesaj de alera în consola.
Puneti acest script sa ruleze in ~/.bashrc
"""    


import shutil
import os
import logging

# Configurare logging
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s"
)

def get_disk_usage_percent(path="/"):
    total, used, free = shutil.disk_usage(path)
    return (used / total) * 100

def main():
    # Pragul poate fi setat prin variabila de mediu, altfel se foloseste 90
    threshold_str = os.getenv("DISK_USAGE_THRESHOLD", "90")
    try:
        threshold = float(threshold_str)
    except ValueError:
        logging.warning(f"Valoare invalida pentru prag: {threshold_str}, se foloseste 90%")
        threshold = 90.0

    usage_percent = get_disk_usage_percent()

    if usage_percent > threshold:
        print(f"ALERTA: Utilizarea discului este {usage_percent:.2f}% (prag: {threshold}%)")
    else:
        logging.info(f"Utilizarea discului este {usage_percent:.2f}%, sub pragul de {threshold}%.")

if __name__ == "__main__":
    main()

