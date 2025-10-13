#!/bin/bash

# Exercitiul 1:
# Rulati imaginea de docker cu numele hello-world si verificati logurile.
# Verificati apoi daca mai ruleaza containerul.
# Stergeti imaginea hello-world din local.

echo "Exercitiul 1: Rulare si verificare hello-world"

echo "1. Rulam imaginea 'hello-world'."
docker run hello-world

echo "2. Afisam toate containerele (inclusiv cele oprite)."
docker ps -a

echo "3. Verificam daca containerul 'hello-world' mai ruleaza."
docker ps | grep hello-world

# De obicei, 'hello-world' se opreste imediat dupa rulare

echo "4. Stergem imaginea 'hello-world' din local."
docker rmi hello-world

echo "Scriptul a fost executat cu succes!"

