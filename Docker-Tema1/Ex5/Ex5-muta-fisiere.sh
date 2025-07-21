#!/bin/bash

IMAGE_NAME="muta-fisiere"

# Setup directoare locale
mkdir -p /tmp/input /tmp/output

# Creaza fisiere de test
echo "fisier 1" > /tmp/input/file1.txt
echo "fisier 2" > /tmp/input/file2.txt
echo "fisier 3" > /tmp/input/file3.txt
echo "fisier 4" > /tmp/input/file4.txt
echo "fisier 5" > /tmp/input/file5.txt
echo "fisier 6" > /tmp/input/file6.txt
echo "fisier 7" > /tmp/input/file7.txt
echo "fisier 8" > /tmp/input/file8.txt

# Construim imaginea
echo "[INFO] Construim imaginea Docker."
docker build -t $IMAGE_NAME .

# Rulam 4 containere identice
echo "[INFO] Rulam 4 containere."
for i in {1..4}; do
    docker run --rm -v /tmp/input:/input -v /tmp/output:/output $IMAGE_NAME &
done

# Asteptam containerele sa termine
wait
echo "[INFO] Toate containerele au terminat."

# Verificam output
echo "[INFO] Fisiere mutate in /tmp/output:"
ls /tmp/output

