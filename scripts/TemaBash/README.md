# Bash Scripting - Exerciții

Acesta este o tema cu exerciții Bash pentru practica scriptingului în shell.
Fiecare script include cerința în comentariu, validări de bază, mesaje explicative și coduri de ieșire corecte.



## Exercițiul 1: Așteptare fișier

**Cerință:**  
Scriptul așteaptă până când un fișier specific apare pe disc. După detectarea fișierului, scriptul iese cu succes.  
**Bonus:**  
Scriptul nu așteaptă la nesfârșit, ci maxim 1 minut. Dacă fișierul apare mai devreme, scriptul se oprește imediat.

**Fișier script:**  
[`ex1-asteapta-fisier.sh`](./ex1-asteapta-fisier.sh)

### Rulare

./ex1-asteapta-fisier.sh

Comportament:
    Dacă fișierul fisier_de_test.txt apare, se afișează un mesaj de succes și scriptul iese cu 0.
    Dacă trece 1 minut fără ca fișierul să fie creat, scriptul afișează eroare și iese cu 1.






## Exercițiul 2: Comparare fișiere (sha256sum)

**Cerință:**  
Scriptul primește două fișiere și verifică dacă sunt identice ca și conținut folosind sha256sum.

**Bonus:**  
Scriptul primește o listă de fișiere (oricâte) și verifică dacă toate sunt identice. Dacă cel puțin două fișiere diferă, afișează mesaj de eroare și iese cu cod diferit de 0.

**Fișier script:**  
[`ex2-compara-fisiere.sh`](./ex2-compara-fisiere.sh)

### Rulare
./ex2- compara-fisiere.sh fisier1 fisier2 [fisier3 ...]

Coduri de ieșire:
    0 – Toate fișierele sunt identice.
    1 – Număr insuficient de argumente.
    2 – Unul sau mai multe fișiere nu există.
    3 – Fișierele diferă ca și conținut.

Ce face scriptul:
    Primește minim 2 fișiere ca argumente.
    Verifică dacă toate fișierele există.
    Calculează hash-ul SHA256 pentru fiecare.
    Compară hash-urile.
    Dacă toate sunt egale, scriptul iese cu 0 și un mesaj de succes.
    Dacă măcar unul diferă, iese cu 3 și un mesaj de eroare.






## Exercițiul 3: Verificare site disponibil

**Cerință:**  
Scriptul verifică dacă un site este disponibil (status code între 200 și 399), folosind `curl`. Numărul maxim de încercări este primit ca argument.

**Fișier script:**  
[`ex3-verifica-site.sh`](./ex3-verifica-site.sh)

### Rulare
./ex3-verifica-site.sh https://google.com 7
./ex3-verifica-site.sh http://example.com/redirect 6
./ex3-verifica-site.sh https://example.com/notfound 8

Coduri de ieșire
    0 – Site-ul este disponibil.
    1 – Argumente insuficiente.
    2 – Al doilea argument nu e numeric.
    3 – Site-ul nu a fost disponibil în limita de încercări.

Ce face scriptul:
    Validează că ai dat exact două argumente.
    Verifică că numărul maxim de încercări este numeric.
    Rulează curl și verifică status code-ul.
    Așteaptă 2 secunde între încercări.
    Se oprește imediat dacă site-ul răspunde corect (200–399).
    Returnează coduri de ieșire:
        0 – succes
        1 – argumente insuficiente
        2 – al doilea argument nu e un număr
        3 – site indisponibil




## Exercițiul 5: Backup fișier doar dacă a fost modificat
 
**Cerință:**
Scriptul face backup la un fișier primit prin variabila de mediu BACKUP_FILE_PATH, doar dacă fișierul a fost modificat (comparând hash-ul conținutului cu cel al backupurilor existente).

**Fișier script:**
./ex5-backup-file.sh)

### Rulare
export BACKUP_FILE_PATH=my-file.txt
_

Coduri de ieșire
	0 – Backup creat cu succes sau redenumire efectuată.
	1 – Variabila BACKUP_FILE_PATH nu a fost setată.
	2 – Fișierul specificat nu există.

Ce face scriptul:
	Verifică dacă BACKUP_FILE_PATH este setată și dacă fișierul există.
	Setează BACKUP_DIR la valoarea din variabilă sau backup dacă nu este setată.
	Creează directorul de backup dacă lipsește.
	Generează hash-ul fișierului original (sha256sum) și caută dacă există un backup cu același conținut.
	Dacă se găsește un backup identic, îl redenumește cu un timestamp nou.
	Dacă nu există backup identic, creează unul nou cu timestamp în nume (format: YYYY-MM-DD-HH-MM-SS).








## Exercițiul 7: Afișare utilizatori dintr-un grup

**Cerință:**
Scriptul afișează toți utilizatorii care fac parte dintr-un grup, separați prin spațiu. Scriptul primește ca argument obligatoriu numele grupului.

**Fișier script:**
./ex7-group-list.sh

### Rulare
./ex7-group-list.sh sudo
./ex7-group-list.sh grup_inexistent

Coduri de ieșire
    0 – Scriptul a rulat cu succes.
    1 – Lipsă argument (numele grupului nu a fost dat).
    2 – Grupul nu există

Ce face scriptul:
    Verifică dacă a fost primit exact un argument.
    Caută grupul specificat în fișierul /etc/group.
    Dacă grupul există:
        Extrage lista de utilizatori asociați.
        Afișează utilizatorii, separați prin spațiu.

    Dacă grupul nu conține niciun utilizator, nu afișează nimic.
    Dacă grupul nu există, afișează un mesaj de eroare.













