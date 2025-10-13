#!/bin/bash

# Exercitiul 10:
# Creati o noua retea de tipul bridge cu numele retea-interna.
# Porniti doua containere de tipul tools (vezi exercitiul 9) cu nume diferite.
# Logati-va pe fiecare container si incercati sa dati ping la celalalt container folosind IP-ul si apoi DNS-ul.
# Deconectati DOAR primul container de la reteaua retea-interna. Incercati iar sa dati ping intre containere pe baza de IP si pe baza de DNS.
# Conectati ambele containere la reteaua bridge default.
# Inspectati ambele retele (bridge-ul default si retea-interna) si verificati ce containere sunt atasate.
# Inspectati si containerele si verificati la ce retele sunt conectate.


set -e

# 1. Creare retea bridge custom
docker network create --driver bridge retea-interna

# 2. Pornire doua containere din imaginea 'tools'
docker run -dit --name c1 --network retea-interna tools
docker run -dit --name c2 --network retea-interna tools

# 3. Afiseaza IP-urile containerelor
IP_C1=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' c1)
IP_C2=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' c2)

echo "IP C1: $IP_C1"
echo "IP C2: $IP_C2"

# 4. Test ping intre containere (IP si DNS)
echo "Ping de la c1 catre c2 (IP):"
docker exec c1 ping -c 2 $IP_C2

echo "Ping de la c1 catre c2 (DNS):"
docker exec c1 ping -c 2 c2

echo "Ping de la c2 catre c1 (IP):"
docker exec c2 ping -c 2 $IP_C1

echo "Ping de la c2 catre c1 (DNS):"
docker exec c2 ping -c 2 c1

# 5. Deconectare c1 de la retea-interna
docker network disconnect retea-interna c1
echo "c1 a fost deconectat de la retea-interna."

# 6. Test ping din nou (c2 -> c1 si c1 -> c2)
echo "Ping de la c2 catre c1 dupa deconectare (IP):"
docker exec c2 ping -c 2 $IP_C1 || echo "Eroare (asteptata)"

echo "Ping de la c2 catre c1 dupa deconectare (DNS):"
docker exec c2 ping -c 2 c1 || echo "Eroare (asteptata)"

# 7. Conectare ambelor containere la reteaua bridge default
docker network connect bridge c1
docker network connect bridge c2

# 8. Inspectare retele
echo "Inspectare retea bridge default:"
docker network inspect bridge --format '{{json .Containers}}' | jq

echo "Inspectare retea retea-interna:"
docker network inspect retea-interna --format '{{json .Containers}}' | jq

# 9. Inspectare containere
echo "Inspectare container c1 - retele conectate:"
docker inspect -f '{{json .NetworkSettings.Networks}}' c1 | jq

echo "Inspectare container c2 - retele conectate:"
docker inspect -f '{{json .NetworkSettings.Networks}}' c2 | jq

