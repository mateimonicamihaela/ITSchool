#!/bin/bash

# Exercitiul 2: Rulati un container de busybox folosind comanda sleep in detached mode.
# Puneti un nume containerului. Ce observati?
# Accesati containerul în linie de comandasi listati procesele.
# Omorati si stergeti containerul.

echo "Exercitiul 2: Rulare container busybox in background (detached mode)"

# 1. Rulam containerul in background (detached mode), cu un nume specific (ex: busy-sleeper)
echo "1. Rulam containerul 'busy-sleeper' cu comanda 'sleep 300'..."
docker run -d --name busy-sleeper busybox sleep 300

# 2. Verificam daca containerul ruleaza
echo "2. Verificam containerele active."

docker ps

echo "Observatie: Containerul ruleaza in fundal (detached), cu procesul 'sleep 300'."

# 3. Accesam containerul in linia de comanda (folosind exec)
echo "3. Accesam containerul si listam procesele din interior."
docker exec -it busy-sleeper ps

# 4. Oprirea si stergerea containerului
echo "4. Oprirea containerului..."
docker stop busy-sleeper

echo "5. Stergerea containerului..."
docker rm busy-sleeper

echo "Containerul a fost oprit si sters. Exercitiul 2 finalizat."

