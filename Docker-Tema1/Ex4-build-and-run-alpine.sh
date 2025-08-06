#!/bin/bash

# Exercitiul 4: 
# Construiti o imagine de docker simpla care printeaza mesajul "Salut din container" (folosind comanda echo).
# Folositi imaginea de baza alpine. De ce credeti ca am folosit aceasta imagine?
# Rulati imaginea si incercati sa-i dati cat mai putin cpu si memory. 
# Care sunt valorile cele mai mici pentru CPU si memory pe care ati reusit sa i le dati containerului?


#Bonus: Dati push la imagine în contul vostru de DockerHub

echo "1. Construim imaginea Docker cu numele salut-container."
docker build -t salut-container .

echo "2. Rulam containerul cu resurse limitate (CPU si memorie)."
docker run --rm --name salut-test \
  --cpus="0.1" \
  --memory="16m" \
  salut-container

echo "3. Containerul a fost rulat cu succes cu resurse minime."

echo "Bonus: Daca ai un cont DockerHub, poti face push astfel:"
echo " docker tag salut-container mateimonicamihaela/salut-container"
echo " docker push mateimonicamihaela/salut-container"





