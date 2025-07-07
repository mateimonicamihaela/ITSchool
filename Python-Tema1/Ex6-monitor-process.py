"""
Vrei să monitorizezi o aplicație pe care ai lansat-o (de exemplu, un script sau un serviciu) și
să te asiguri că procesul rulează continuu. Dacă procesul se oprește, scriptul va încerca să îl
pornească din nou.
1. Folosește o buclă while pentru a monitoriza în mod continuu procesul.
2. Verifică dacă procesul este activ folosind comanda pgrep.
3. Dacă procesul nu este găsit, pornește aplicația din nou.
4. Afișează un mesaj de avertizare de fiecare dată când procesul este repornit.
5. Numele procesului ce trebuie monitorizat este hardcodat într-o variabila la începutul
scriptului.
6. Hints:
    - process_name = “my-script.sh”
    - process_check = subprocess.run(["pgrep", "-f",process_name], capture_output=True, text=True)
    - if process_check.returncode != 0:...
"""

import subprocess
import time

process_name = "my-script.sh"  # Numele procesului de monitorizat
start_command = ["./my-script.sh"]  # Comanda pentru a porni procesul (adaptă după nevoie)

while True:
    # Verificăm dacă procesul rulează
    process_check = subprocess.run(["pgrep", "-f", process_name], capture_output=True, text=True)

    if process_check.returncode != 0:
        # Procesul nu rulează, îl pornim
        print(f"Procesul '{process_name}' nu rulează. Încerc să îl pornesc...")
        try:
            subprocess.Popen(start_command)
            print(f"Procesul '{process_name}' a fost repornit.")
        except Exception as e:
            print(f"Eroare la pornirea procesului: {e}")
    else:
        print(f"Procesul '{process_name}' rulează normal.")

    # Așteptăm 10 secunde înainte să verificăm iar
    time.sleep(10)
