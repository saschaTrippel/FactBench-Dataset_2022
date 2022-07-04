#!/bin/bash

# Run: ./replace.sh Cornelis_Janssens_van_Ceulen Cornelius_Johnson_(artist)

OLD=$1
NEW=$2

FILES=$(grep -rl "$1" factbench)
echo $FILES

for FILE in $FILES
do
	sed -i "s/$OLD/$NEW/g" $FILE
done
