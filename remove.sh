#!/bin/bash

FILES=$(grep -rl $1)

for FILE in $FILES
do
	mv $FILE "$FILE-tmp"
	grep -v $1 "$FILE-tmp" > $FILE
	rm "$FILE-tmp"
done
