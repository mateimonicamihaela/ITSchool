#! /bin/bash

if [ "$#" -ne 1 ]; then
	echo "Scriptul asteapta un argument"
	echo "$0 Monica " 
	exit 1
fi	

if [ -z "$NUME_CURSANT" ]; then
	echo "NU EXISTA "
	export NUME_CURSANT=$1
else
        echo "EXISTA"
fi

echo "NUMELE CURSANTULUI ESTE $NUME_CURSANT"
