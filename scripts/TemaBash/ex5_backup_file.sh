#!/bin/bash

# Cerința exercițiului:
# Creează un script care face backup la un fișier specificat prin variabila de mediu BACKUP_FILE_PATH,
# doar dacă fișierul a fost modificat. Backup-urile sunt stocate într-un subdirector specificat printr-o
# variabilă de mediu (cu valoarea implicită "backup"). Numele fișierului de backup include un timestamp.
# Dacă există un backup cu același conținut, acesta este redenumit cu timestamp-ul curent.
# Dacă BACKUP_FILE_PATH nu este setat, se afișează o eroare.


# Setăm valoarea implicită pentru directorul de backup
BACKUP_DIRECTORY=${BACKUP_DIRECTORY:-"./backup"}

# Verificăm dacă variabila BACKUP_FILE_PATH este setată
BACKUP_FILE_PATH=${BACKUP_FILE_PATH}
if [ -z "$BACKUP_FILE_PATH" ]; then
	echo "Eroare: Variabila de mediu BACKUP_FILE_PATH nu este setată."
	exit 1
fi


TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="$BACKUP_DIRECTORY/$(basename "$BACKUP_FILE_PATH")_$TIMESTAMP"

if [ ! -f "$BACKUP_FILE_PATH" ]; then
	echo "Eroare: Fișierul '$BACKUP_FILE_PATH' nu există."
	exit 1
fi
mkdir -p "$BACKUP_DIRECTORY"
ORIGINAL_HASH=$(md5sum "$BACKUP_FILE_PATH" | awk '{print $1}')
for EXISTING_FILE in "$BACKUP_DIRECTORY"/*; do
	if [ -f "$EXISTING_FILE" ]; then
		EXISTING_HASH=$(md5sum "$EXISTING_FILE" | awk '{print $1}')
		if [ "$EXISTING_HASH" == "$ORIGINAL_HASH" ]; then
			mv "$EXISTING_FILE" "$BACKUP_FILE"
			echo "Backup existent redenumit: $BACKUP_FILE"
			exit 0
		fi
	fi
done
cp "$BACKUP_FILE_PATH" "$BACKUP_FILE"
echo "Backup creat: $BACKUP_FILE"
