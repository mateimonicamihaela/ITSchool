1-# Bash Scripting - Exerciții

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
- Dacă fișierul fisier_de_test.txt apare, se afișează un mesaj de succes și scriptul iese cu 0.   
- Dacă trece 1 minut fără ca fișierul să fie creat, scriptul afișează eroare și iese cu 1.   



## Exercițiul 2: Comparare fișiere (sha256sum)

**Cerință:**  
Scriptul primește două fișiere și verifică dacă sunt identice ca și conținut folosind sha256sum.

**Bonus:**  
Scriptul primește o listă de fișiere (oricâte) și verifică dacă toate sunt identice. 
Dacă cel puțin două fișiere diferă, afișează mesaj de eroare și iese cu cod diferit de 0.

**Fișier script:**  

[`ex2-compara-fisiere.sh`](./ex2-compara-fisiere.sh)

### Rulare
./ex2- compara-fisiere.sh fisier1 fisier2 [fisier3 ...]

Coduri de ieșire:
- 0 – Toate fișierele sunt identice.
- 1 – Număr insuficient de argumente.
- 2 – Unul sau mai multe fișiere nu există.
- 3 – Fișierele diferă ca și conținut.

Ce face scriptul:
- Primește minim 2 fișiere ca argumente.
- Verifică dacă toate fișierele există.
- Calculează hash-ul SHA256 pentru fiecare.
- Compară hash-urile.
- Dacă toate sunt egale, scriptul iese cu 0 și un mesaj de succes.
- Dacă măcar unul diferă, iese cu 3 și un mesaj de eroare.



## Exercițiul 3: Verificare site disponibil

**Cerință:**  
Scriptul verifică dacă un site este disponibil (status code între 200 și 399), folosind `curl`.
Numărul maxim de încercări este primit ca argument.

**Fișier script:**  

[`ex3-verifica-site.sh`](./ex3-verifica-site.sh)

### Rulare
- ./ex3-verifica-site.sh https://google.com 7
- ./ex3-verifica-site.sh http://example.com/redirect 6
- ./ex3-verifica-site.sh https://example.com/notfound 8

Coduri de ieșire
- 0 – Site-ul este disponibil.
- 1 – Argumente insuficiente.
- 2 – Al doilea argument nu e numeric.
- 3 – Site-ul nu a fost disponibil în limita de încercări.

Ce face scriptul:
- Validează că ai dat exact două argumente.
- Verifică că numărul maxim de încercări este numeric.
- Rulează curl și verifică status code-ul.
- Așteaptă 2 secunde între încercări.
- Se oprește imediat dacă site-ul răspunde corect (200–399).
- Returnează coduri de ieșire:
	- 0 – succes
 	- 1 – argumente insuficiente
  	- 2 – al doilea argument nu e un număr
  	- 3 – site indisponibil



## Exercițiul 4: 

**Cerință:**


**Fișier script:**

[`ex4-config.sh`](./ex4-config.sh)


### Rulare



Coduri de ieșire:





Ce face scriptul:






## Exercițiul 5: Backup fișier doar dacă a fost modificat
 
**Cerință:**
Scriptul face backup la un fișier primit prin variabila de mediu BACKUP_FILE_PATH, doar dacă fișierul a fost modificat (comparând hash-ul conținutului cu cel al backupurilor existente).

**Fișier script:**

[`ex5-backup-file.sh`](./ex5-backup-file.sh)

### Rulare
export BACKUP_FILE_PATH=my-file.txt

Coduri de ieșire:
- 0 – Backup creat cu succes sau redenumire efectuată.
- 1 – Variabila BACKUP_FILE_PATH nu a fost setată.
- 2 – Fișierul specificat nu există.

Ce face scriptul:
- Verifică dacă BACKUP_FILE_PATH este setată și dacă fișierul există.
- Setează BACKUP_DIR la valoarea din variabilă sau backup dacă nu este setată.
- Creează directorul de backup dacă lipsește.
- Generează hash-ul fișierului original (sha256sum) și caută dacă există un backup cu același conținut.
- Dacă se găsește un backup identic, îl redenumește cu un timestamp nou.
- Dacă nu există backup identic, creează unul nou cu timestamp în nume (format: YYYY-MM-DD-HH-MM-SS).




## Exercițiul 6: 

**Cerință:**


**Fișier script:**

[`ex6_dir_backup.sh`](./ex6_dir_backup.sh)


### Rulare



Coduri de ieșire





Ce face scriptul:








## Exercițiul 7: Afișare utilizatori dintr-un grup

**Cerință:**
Scriptul afișează toți utilizatorii care fac parte dintr-un grup, separați prin spațiu. 
Scriptul primește ca argument obligatoriu numele grupului.  

**Fișier script:**

[`ex7-group-list.sh`](./ex7-group-list.sh)

### Rulare
- ./ex7-group-list.sh sudo
- ./ex7-group-list.sh grup_inexistent

Coduri de ieșire:
- 0 – Scriptul a rulat cu succes.
- 1 – Lipsă argument (numele grupului nu a fost dat).
- 2 – Grupul nu există

Ce face scriptul:
- Verifică dacă a fost primit exact un argument.
- Caută grupul specificat în fișierul /etc/group.
- Dacă grupul există:
	- Extrage lista de utilizatori asociați.
	- Afișează utilizatorii, separați prin spațiu.
- Dacă grupul nu conține niciun utilizator, nu afișează nimic.
- Dacă grupul nu există, afișează un mesaj de eroare.




## Exercițiul 8: Copiere utilizatori între grupuri

**Cerință:**  
Scriptul copiază toți utilizatorii care fac parte dintr-un **grup sursă** în alt **grup destinație**.  
Scriptul primește **doi parametri obligatorii**: numele grupului sursă și numele grupului destinație (în această ordine).  
Grupurile trebuie să fie diferite.

**Fișier script:**  

[`ex8-group-copy.sh`](./ex8-group-copy.sh)

### Rulare
- sudo ./ex8-group-copy.sh developers testers
- sudo ./ex8-group-copy.sh testers testers
- sudo ./ex8-group-copy.sh grup_inexistent testers

Coduri de ieșire:
- 0 - Scriptul a rulat cu succes.
- 1 - Lipsă argumente (nu au fost dați exact 2 parametri).
- 2 - Grupul sursă și grupul destinație sunt identice.
- 3 - Grupul sursă nu există.
- 4 - Grupul destinație nu există.
- 5 - Grupul sursă nu conține niciun utilizator.

Ce face scriptul:




## Exercițiul 9: Verificare și restart automat pentru serviciul `ssh` 

**Cerință:**
Scrieți un script care verifică dacă serviciul `ssh` (OpenSSH Server) este oprit.  
Dacă este oprit, scriptul trebuie să îl pornească automat.  
Scriptul trebuie adăugat în `crontab` pentru a rula **la fiecare minut**.

**Fișier script:**
[`ex9-check-sshd`](./ex9-check-sshd)


### Rulare
- chmod +x ex9-check-sshd.sh
- sudo ./ex9-check-sshd.sh
- sudo crontab -e
	- Adaugă linia de cron la finalul fișierului deschis:
	Edit this file to introduce tasks to be run by cron.
	* * * * * /home/eu/work/ITSchool/scripts/TemaBash/ex9-check-sshd.sh >> /var/log/ex9-check-sshd.log 2>&1
- sudo crontab -l
- sudo systemctl stop ssh
- systemctl status ssh
- cat /var/log/ex9-check-sshd.log


Coduri de ieșire:

Scriptul se bazează pe comanda systemctl is-active:
- Returnează 0 dacă serviciul este activ.
- Returnează 3 sau inactive dacă serviciul este oprit.

Ce face scriptul:


Verifică dacă serviciul `ssh` este activ folosind `systemctl`.
- Dacă serviciul este oprit:
  - Scriptul încearcă să îl repornească automat.
  - Afișează un mesaj cu succesul sau eșecul operației.
- Scriptul adaugă timestamp la fiecare mesaj pentru ușurința logării.
- Este destinat să ruleze periodic prin `cron` pentru monitorizare automată.




## Exercițiul 10: Adăugare automată a directorului `~/bin-itschools/` în PATH

**Cerință:**
Adaugati in variabila de mediu PATH directorul cu calea ~/bin-itschools/ doar dacă acesta exista. 
Faceți acest lucru în mod automat de fiecare data cand se porneste o sesiune cu login pentru userul curent.
Adaugati un script în acel director și încercați să-l executați de oriunde.


**Fișier script:**

[`ex10-add-to-path.sh`](./ex10-add-to-path.sh)


### Rulare
chmod +x ex10-add-path.sh
nano ~/.bash_profile
[ -f ~/scripts/ex10-add-path.sh ] && . ~/scripts/ex10-add-path.sh
mkdir -p ~/bin-itschools
echo -e '#!/bin/bash\necho \"Salut de la IT School!\"' > ~/bin-itschools/hello-itschool.sh
chmod +x ~/bin-itschools/hello-itschool.sh
source ~/.bash_profile
hello-itschool.sh


Coduri de ieșire

- Scriptul se bazează pe validări simple:
   - exit 0 dacă directorul a fost adăugat cu succes (sau era deja în PATH).
   - exit 1 dacă directorul nu există și nu s-a făcut nicio modificare.


Ce face scriptul:

-Verifică dacă directorul ~/bin-itschools/ există.
	- Dacă da:
		- Verifică dacă este deja în PATH.
		- Dacă nu este, îl adaugă la începutul PATH (pentru prioritate).

	- Dacă directorul nu există:
		- Scriptul afișează o eroare și iese cu cod de eroare.
Acest script este util pentru a crea un spațiu personal de comenzi/scripturi executabile, disponibil global pentru utilizator.


## Exercițiul 11: 

**Cerință:**
Log rotation: Faceți un script ce face log rotation la un fisier de loguri primit ca argument.
Pentru simplitate log rotation-ul se face automat la un numar de secunde primit ca argument.
Cand se face log rotation se copiază fișierul curent într-un nou fișier cu același nume ca fișierul original + un timestamp iar fișierul original se golește.
Fisierele de log rotation se și arhivează pentru a ocupa mai puțin spațiu.
Faceți un script simplu ce printeaza la nesfarsit in loguri pentru a testa scriptul de log rotation (vedeti hello.sh de la curs). 


**Fișier script:**

- [`ex11-log-rotate.sh`](./ex11-log-rotate.sh) – scriptul principal de log rotation
- [`ex11-generate-logs.sh`](./ex11-generate-logs.sh) – script de test care scrie continuu în log


### Rulare

- touch /tmp/test.log
- ./ex11-generate-logs.sh /tmp/test.log  (Într-un terminal rulează generatorul de loguri)
- ./ex11-log-rotate.sh /tmp/test.log 10  (În alt terminal rulează log rotation-ul (la fiecare 10 secunde, de exemplu))


Coduri de ieșire
- exit 0 – Succes
- exit 1 – Lipsă argumente
- exit 2 – Fișierul de log nu există
- exit 3 – Argumentul pentru interval nu este număr valid


Ce face fiecare  script:

- ex11-log-rotate.sh
- Primește:
	- Calea fișierului log.
	- Numărul de secunde între rotații.

- La fiecare interval:
	- Creează o copie a logului cu timestamp.
	- Golește fișierul original.
	- Arhivează copia (.gz).
	- Afișează un mesaj în terminal.

- ex11-generate-logs.sh
	- Scrie în buclă mesaje timestampate în logul specificat.
	- Poate fi oprit cu Ctrl + C.



## Exercițiul 12: 

**Cerință:**
Scrieți un script care caută toate fișierele `.sh` dintr-un director dat ca parametru și verifică dacă au shebang-ul `#!/bin/bash`.  
Dacă nu au, shebang-ul este adăugat automat la începutul fișierului.

**Fișier script:**

[`ex12-add-shebang.sh`](./ex12-add-shebang.sh)

### Rulare
- chmod +x ex12-add-shebang.sh
- Stergem #!/bin/bash chiar din exercitiul nostru si ulterior rulam
- ./ex12-add-shebang.sh ~/work/ITSchool/scripts/TemaBash


Coduri de ieșire
- exit 0 – Succes
- exit 1 – Lipsă argument
- exit 2 – Directorul nu există


Ce face scriptul:
- Scriptul verifică fișierele .sh (doar din directorul specificat, nu recursiv).
- Dacă primul rând nu începe cu #!, se adaugă automat linia: #!/bin/bash
- Scriptul nu modifică fișierele care deja au shebang.
- Modificarea este făcută direct în fișiere, fără backup




## Exercițiul 13:  Implementare simplă a comenzii `which` 

**Cerință:**

Faceti un script cu numele which.sh ce:
- Parseaza variabila PATH și pune într-un array toate căile.
- Itereaza cu un for pe acest array de cai și pentru fiecare cale:
	- cauta dacă acea cale contine un fisier executabil cu numele primit ca argument la script (de exemplu ./which.sh ls)
	- afișează toate căile ce conțin acel executabil.
- Dacă nu a găsit nicio cale ce contine acel executabil afișați în mesaj de eroare și terminati scriptul cu un cod de eroare.



**Fișier script:**

[`ex13-which.sh`](./ex13-which.sh)


### Rulare
chmod +x ex13-which.sh
./ex13-which.sh ls  -----> Executabil gasit in: /usr/bin/ls  si /bin/ls
./ex13-which.sh dhabsgh -------> Eroare: Nu s-a găsit niciun executabil


Coduri de ieșire
- exit 0 – Executabilul a fost găsit
- exit 1 – Nu a fost furnizat niciun argument
- exit 2 – Executabilul nu a fost găsit în niciun director din PATH

Ce face scriptul:
- Scriptul folosește IFS=':' pentru a sparge variabila PATH în array.
- Verificarea se face cu -x (executabil) și cale completă ($dir/$EXEC_NAME).
