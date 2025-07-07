#!/usr/bin/env python3
"""
Exercițiul 4:
1. Pentru acest exercițiu trebuie creat un fisier pe disk cu numele urls.txt ce conține
pe fiecare linie cate o adresa url, de genul:
○ https://httpstat.us/201
○ https://httpstat.us/400
○ https://httpstat.us/500
○ https://httpstat.us/404
○ https://httpstat.us/201
○ https://httpstat.us/503
○ https://httpstat.us/200
○ https://httpstat.us/303
2. Citește linie cu line conținutul fișierului urls.txt
3. Folosește libraria requests pentru a face un call http catre fiecare url
4. Daca url-ul a intors un status de success (intre 200 si 299) adauga url-ul intr-un fisier
cu numele success.txt
5. Daca url-ul a intors un status de eroare (orice status intre 300 si 599) adauga url-ul
intr-un fisier cu numele errors.txt
"""

import requests

# 1. Citim URL-urile din fisier
try:
    with open("urls.txt", "r") as fisier:
        url_list = [linie.strip() for linie in fisier if linie.strip()]
except FileNotFoundError:
    print("Fisierul urls.txt nu a fost gasit.")
    exit()

# 2. Deschidem fisierele pentru scrierea rezultatelor
with open("success.txt", "w") as success_file, open("errors.txt", "w") as errors_file:
    for url in url_list:
        try:
            response = requests.get(url, verify=False)
            status = response.status_code

            if 200 <= status <= 299:
                success_file.write(f"{url} - {status}\n")
                print(f"SUCCESS: {url} - {status}")
            elif 300 <= status <= 599:
                errors_file.write(f"{url} - {status}\n")
                print(f"ERROR: {url} - {status}")
            else:
                print(f"Unknown status: {url} - {status}")
        except requests.RequestException as e:
            errors_file.write(f"{url} - Request failed: {e}\n")
            print(f"Request failed for {url}: {e}")
