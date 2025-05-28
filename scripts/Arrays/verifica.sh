#! /bin/bash


read -p "Introdu calea catre un fisier: " argument

hash_argument=$(sha256sum $argument | awk '{print $1}')
echo $hash_argument

for file in *.sh; do
	echo "Verificam fisierul: " $file
	sha256sum $file
	hash_file=$(sha256sum $file | awk '{print $1}')
	echo $hash_file

	if [ "$ash_argument" == "$hash_file" ];then
		echo "Am gasit fisierul:" $file
		exit 0
	fi
done

echo "Nu am gasit nici un fisier"
exit 1
