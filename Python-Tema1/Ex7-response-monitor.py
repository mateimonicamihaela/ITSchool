"""
Exercitiul 7:

Vrei să monitorizezi timpul de răspuns al unui site web pentru a verifica dacă serverul
răspunde rapid. Scriptul va trimite cereri HTTP la fiecare 2 secunde și va afișa timpul de
răspuns în milisecunde.

1. Scrieți o funcție ce primește ca parametru un url și întoarce timpul de răspuns al
paginii (cat dureaza sa primim un răspuns).
○ folosește libraria time pt asta.

2. Adaugati încă o funcție ce primește doi parametrii (un url si un numar de repetari):
○ Funcția va face într-un for sau while un număr de cal-uri către url și va
memora timpurile de răspuns într-o listă (folosind prima metoda)
○ Funcția va face o medie și va întoarce într-un tuplu 3 valori în următoarea
ordine: (min, media, max)
○ Rulați de cateva ori funcția cu cateva url-uri si afisati rezultatele
"""

import requests
import time

def masura_timp_raspuns(url):
    
    # Primește un URL și întoarce timpul de răspuns în milisecunde.
    
    start = time.time()
    try:
        response = requests.get(url)
        response.raise_for_status()
    except Exception as e:
        print(f"Eroare la accesarea {url}: {e}")
        return None
    end = time.time()
    return (end - start) * 1000  # milisecunde

def monitorizare_timp_raspuns(url, numar_repetari):
    
    # Face numar_repetari cereri către url și întoarce (min, media, max) timpilor de răspuns în ms.
    
    timpi = []
    for _ in range(numar_repetari):
        timp = masura_timp_raspuns(url)
        if timp is not None:
            timpi.append(timp)
        time.sleep(2)  # pauza 2 secunde între cereri

    if not timpi:
        return None, None, None
    return min(timpi), sum(timpi) / len(timpi), max(timpi)


# Exemplu de rulare
urls = [
    "https://www.google.com",
    "https://httpstat.us/200",
    "https://httpstat.us/500"
]

for url in urls:
    min_timp, medie_timp, max_timp = monitorizare_timp_raspuns(url, 3)
    if min_timp is not None:
        print(f"URL: {url}")
        print(f"  Min timp răspuns: {min_timp:.2f} ms")
        print(f"  Medie timp răspuns: {medie_timp:.2f} ms")
        print(f"  Max timp răspuns: {max_timp:.2f} ms\n")
    else:
        print(f"URL: {url} - Nu s-au putut obține timpi de răspuns.\n")
