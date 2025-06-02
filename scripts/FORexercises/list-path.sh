
#! /bin/bash

dir_PATH=$(echo $PATH | tr ':' ' ')

for cale in $dir_PATH; do
	current_dir=$( ls -alh $cale | wc -l )
	echo "Numar fisiere $current_dir"
	echo $cale

done


