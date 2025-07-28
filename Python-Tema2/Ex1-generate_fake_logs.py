#!/usr/bin/env python3

"""
Exercitiul 1:

Faceti un script de python ce genereaza un log fake. 
Cerinte:
    - scriptul primeste ca argument cate linii de log sa genereze
    - fiecare linie este scrisa cu un level de logging random (INFO, WARNING, sau ERROR) 
    - fiecare linie de log contine:
        - un mesaj random dintr-o lista de mesaje predefinite de voi
        - un request id random dintr-o lista fixa de 10 request id-uri generata la începutul scriptului (fiecare request id este un UUID)
        - data si ora la care s-a printat mesajul si nivelul de logging
Folositi cateva comenzi de shell sa explorati log-ul generat.
    
Hint:
    - random.choice(my_list)
    - uuid.uuid4()
    - logging library configurata ca la curs (vezi Comenzi Utile)
    
"""


import logging
import random
import uuid
import argparse

# Configurare logging: fisier + consola

logging.basicConfig(
    level=logging.DEBUG,
    format='%(asctime)s - %(levelname)s - [request_id=%(request_id)s] - %(message)s',
    handlers=[
        logging.FileHandler("generated_logs.log"),
        logging.StreamHandler()
    ]
)

# LoggerAdapter pentru a adauga request_id

class RequestLoggerAdapter(logging.LoggerAdapter):
    def process(self, msg, kwargs):
        return msg, {"extra": {"request_id": self.extra["request_id"]}}

# Lista mesaje si niveluri

MESSAGES = [
    "User login successful",
    "User failed authentication",
    "File not found",
    "Connection timeout",
    "Database updated",
    "Permission denied",
    "Session expired",
    "Data validation error",
    "Email sent to user",
    "Unhandled exception occurred"
]

LOG_LEVELS = ['INFO', 'WARNING', 'ERROR']


# Functia principala

def main():
    parser = argparse.ArgumentParser(description="Genereaza un log fals cu linii aleatoare.")
    parser.add_argument("num_lines", type=int, help="Numarul de linii de log de generat")
    args = parser.parse_args()

    # Genereaza 10 UUID-uri unice
    request_ids = [str(uuid.uuid4()) for _ in range(10)]

    for _ in range(args.num_lines):
        level = random.choice(LOG_LEVELS)
        message = random.choice(MESSAGES)
        request_id = random.choice(request_ids)

        # Creeaza un LoggerAdapter cu request_id
        adapter = RequestLoggerAdapter(logging.getLogger(__name__), {"request_id": request_id})

        if level == 'INFO':
            adapter.info(message)
        elif level == 'WARNING':
            adapter.warning(message)
        elif level == 'ERROR':
            adapter.error(message)

if __name__ == "__main__":
    main()

