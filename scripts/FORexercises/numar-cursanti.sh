#! /bin/bash
# In script numaram cati cursanti avem cu #


cursanti=("Alice" "Bob" "Charlie" "Dan")

echo "Avem ${#cursanti[@]} cursanti"

for cursant in ${cursanti[@]};do
	echo "Nume cursant: $cursant"
done


