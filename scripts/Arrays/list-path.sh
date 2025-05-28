
#! /bin/bash

dir_path=$(echo $PATH |tr ':' ' ')
for cale in $dir_path; do
	current_dir=$( ls -alh $cale | wc -l)
	echo "Numar fisiere $current_dir"
	echo $cale
done

