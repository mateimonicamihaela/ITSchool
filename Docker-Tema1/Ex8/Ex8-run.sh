#!/bin/bash

set -e

# Creeaza volumul Docker
docker volume create loguri

# Ruleaza containerul Python care scrie loguri
docker run -d --name logger-app \
  -v loguri:/log \
  logger-image

# Ruleaza containerul Nginx care serveste logurile
docker run -d --name nginx-log-server \
  -p 8080:80 \
  -v loguri:/usr/share/nginx/html \
  nginx

echo "Aplicatia scrie loguri in timp real."
echo "Acceseaza logurile in browser la: http://localhost:8080/app.log"

