#!/bin/bash

# Exercitiul 11:
# Creati 2 retele Docker de tip bridge cu numele public si private. Reteaua private trebuie sa nu aiba acces la internet (vezi optiunea --internal).
# Porniti 3 containere de Docker plecand de la imaginea tools (vezi exercitiul 9). Numele containerelor sunt: frontend, backend si database.
# Conectati containerele la aceste retele astfel incat:
#   - frontend poate sa acceseze backend, dar nu si baza de date.
#   - backend poate sa acceseze atat frontend cat si database.
#   - database poate fi accesata doar de catre backend si nu are acces la internet.
# Verificati aceste conexiuni facand ping din fiecare container.



set -e

# 1. Creare retele
docker network create --driver bridge public
docker network create --driver bridge --internal private

# 2. Pornire containere
docker run -dit --name frontend tools
docker run -dit --name backend tools
docker run -dit --name database tools

# 3. Conectare la retele conform cerintei

# frontend: doar in reteaua public
docker network connect public frontend

# backend: in public si in private
docker network connect public backend
docker network connect private backend

# database: doar in private
docker network connect private database

# Optional: deconectare implicita bridge (daca e cazul)
docker network disconnect bridge frontend || true
docker network disconnect bridge backend || true
docker network disconnect bridge database || true

# 4. Afisare IP-uri pentru testare
echo "IP-uri pentru referinta:"
echo "frontend:"
docker inspect -f '{{range .NetworkSettings.Networks}}{{.NetworkID}} {{.IPAddress}}{{end}}' frontend

echo "backend:"
docker inspect -f '{{range .NetworkSettings.Networks}}{{.NetworkID}} {{.IPAddress}}{{end}}' backend

echo "database:"
docker inspect -f '{{range .NetworkSettings.Networks}}{{.NetworkID}} {{.IPAddress}}{{end}}' database

echo ""
echo "   TESTARE CONECTIVITATE   "

echo "[frontend -> backend] (trebuie sa mearga)"
docker exec frontend ping -c 2 backend || echo "Eroare: Nu merge (ar trebui sa mearga)"

echo "[frontend -> database] (NU trebuie sa mearga)"
docker exec frontend ping -c 2 database || echo "OK: Acces blocat, conform cerintei"

echo "[backend -> frontend] (trebuie sa mearga)"
docker exec backend ping -c 2 frontend || echo "Eroare: Nu merge (ar trebui sa mearga)"

echo "[backend -> database] (trebuie sa mearga)"
docker exec backend ping -c 2 database || echo "Eroare: Nu merge (ar trebui sa mearga)"

echo "[database -> frontend] (NU trebuie sa mearga)"
docker exec database ping -c 2 frontend || echo "OK: Acces blocat, conform cerintei"

echo "[database -> google.com] (NU trebuie sa mearga – fara internet)"
docker exec database ping -c 2 google.com || echo "OK: Fara acces la internet (corect)"

echo ""
echo "Inspectare retele si atasamente:"
docker network inspect public --format '{{json .Containers}}' | jq
docker network inspect private --format '{{json .Containers}}' | jq

echo "Inspectare retele pentru fiecare container:"
echo "frontend:"
docker inspect -f '{{json .NetworkSettings.Networks}}' frontend | jq

echo "backend:"
docker inspect -f '{{json .NetworkSettings.Networks}}' backend | jq

echo "database:"
docker inspect -f '{{json .NetworkSettings.Networks}}' database | jq

