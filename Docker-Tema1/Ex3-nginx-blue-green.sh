#!/bin/bash

# Exercitiul 3: 
# Porniti un server nginx cu numele blue pe portul 8080 si altul cu numele green pe portul 8090.
# Pentru fiecare server serviti un fisier static index.html din local cu background blue respectiv green.
# Accesati-le in browser.


# Cream directoarele locale pentru fisierele index.html
mkdir -p nginx-blue
mkdir -p nginx-green

# Cream fisierul index.html pentru serverul blue
cat <<EOF > nginx-blue/index.html
<!DOCTYPE html>
<html>
<head>
  <title>Blue Server</title>
  <style>
    body { background-color: blue; color: white; text-align: center; padding-top: 50px; }
  </style>
</head>
<body>
  <h1>Server Blue - Port 8080</h1>
</body>
</html>
EOF

# Cream fisierul index.html pentru serverul green
cat <<EOF > nginx-green/index.html
<!DOCTYPE html>
<html>
<head>
  <title>Green Server</title>
  <style>
    body { background-color: green; color: white; text-align: center; padding-top: 50px; }
  </style>
</head>
<body>
  <h1>Server Green - Port 8090</h1>
</body>
</html>
EOF

# Pornim containerul nginx pentru blue pe portul 8080
echo "Pornim containerul 'blue' pe portul 8080..."
docker run -d --name blue -p 8080:80 -v "$(pwd)/nginx-blue":/usr/share/nginx/html:ro nginx

# Pornim containerul nginx pentru green pe portul 8090
echo "Pornim containerul 'green' pe portul 8090..."
docker run -d --name green -p 8090:80 -v "$(pwd)/nginx-green":/usr/share/nginx/html:ro nginx

echo "Serverele 'blue' si 'green' sunt pornite."

echo "Acceseaza-le in browser:"
echo " - http://localhost:8080 (fundal albastru)"
echo " - http://localhost:8090 (fundal verde)"

