#!/bin/bash

# Script de curatare pentru Exercitiul 3: containere nginx blue si green

echo "1. Oprire containere 'blue' si 'green' (daca ruleaza)."
docker stop blue 2>/dev/null
docker stop green 2>/dev/null

echo "2. Stergere containere."
docker rm blue 2>/dev/null
docker rm green 2>/dev/null

echo "3. Stergere directoare nginx-blue si nginx-green."
rm -rf nginx-blue
rm -rf nginx-green

echo "Cleanup complet: containere si directoare sterse."

