#!/bin/bash
set -e

FILES=$(grep -rl $1 factbench-clean)

for FILE in $FILES
do
	mv $FILE "$FILE-tmp"
	grep -v $1 "$FILE-tmp" > $FILE
	rm "$FILE-tmp"
done

echo "* $1" >> README.md
