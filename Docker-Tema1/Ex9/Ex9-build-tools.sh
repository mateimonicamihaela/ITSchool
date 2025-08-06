#!/bin/bash

set -e

# Build imaginea cu numele tools
docker build -t tools .

# Ruleaza containerul in background
docker run -dit --name tools-test tools

# Executa un ping catre google.com
docker exec tools-test ping -c 4 google.com

echo "Containerul tools-test ruleaza cu un shell complet si comenzi de retea"
echo "Poti intra in el cu: docker exec -it tools-test bash"

