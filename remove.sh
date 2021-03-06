#!/bin/bash
set -e
ASSERTIONS=$(grep -rh $1 factbench-clean | awk '{ print $1 }')

echo "## $1" >> README.md

for ASSERTION in $ASSERTIONS
do
	FILES=$(grep -rl $ASSERTION factbench-clean)
	for FILE in $FILES
	do
		mv $FILE "$FILE-tmp"
		grep -v $ASSERTION "$FILE-tmp" > $FILES
		rm "$FILE-tmp"
	done
	echo "* $ASSERTION" >> README.md
done

