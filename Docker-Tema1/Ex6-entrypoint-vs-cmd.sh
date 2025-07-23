#!/bin/bash


# Exercitiul 6:
# 1. Construiti doua imagini Docker separate, ambele pornind de la imaginea de baza ubuntu.
# 2. Prima imagine va folosi instructiunea ENTRYPOINT cu comanda echo.
# 3. A doua imagine va folosi instructiunea CMD cu comanda echo.
#   	- In ambele cazuri, atât ENTRYPOINT, câsi CMD trebuie sa contina doar comanda echo.
# 4. Rulati fiecare imagine separat si testati urmtoarele situatii:
# 	- Furnizati argumentul Salut si verificati rezultatul afisat în terminal.
# 	- Furnizati comanda ls ca argument si observati comportamentul containerului.


# Oprire la prima eroare
set -e

# Creare director pentru imaginea cu ENTRYPOINT
mkdir -p entrypoint_image
cat > entrypoint_image/Dockerfile <<EOF
FROM ubuntu
ENTRYPOINT ["echo"]
EOF

# Creare director pentru imaginea cu CMD
mkdir -p cmd_image
cat > cmd_image/Dockerfile <<EOF
FROM ubuntu
CMD ["echo"]
EOF

# Construire imagini Docker
docker build -t entrypoint-test ./entrypoint_image
docker build -t cmd-test ./cmd_image

echo "Rulez imaginea cu ENTRYPOINT si argumentul 'Salut'"
docker run --rm entrypoint-test Salut

echo "Rulez imaginea cu ENTRYPOINT si argumentul 'ls'"
docker run --rm entrypoint-test ls

echo "Rulez imaginea cu CMD si argumentul 'Salut'"
echo "ATENTIE: CMD este inlocuit complet de 'Salut', care nu este o comanda valida"
docker run --rm cmd-test Salut || echo "Eroare asteptata (Salut nu este comanda valida)"

echo "Rulez imaginea cu CMD si argumentul 'ls'"
echo "ATENTIE: CMD este inlocuit complet de 'ls'"
docker run --rm cmd-test ls || echo "Eroare daca 'ls' nu exista (desi ar trebui)"
