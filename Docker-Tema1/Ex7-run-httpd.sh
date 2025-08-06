#!/bin/bash

# Exercitiul 7:
# Alege o imagine de pe Docker Hub care nu a fost folosita la curs. 
# Incearca sa intelegi ce face imaginea si cum se ruleaza local. Ruleaza imaginea local.


# Oprire la eroare
set -e

# Descarcare imagine Apache HTTP Server
docker pull httpd

# Rulare container in fundal, mapand portul 8080 local la 80 in container
docker run -d --name apache-test -p 8080:80 httpd

echo "Containerul httpd ruleaza. Deschide browserul si acceseaza: http://localhost:8080"
echo "Pentru a opri si sterge containerul, ruleaza:"
echo "  docker stop apache-test && docker rm apache-test"

