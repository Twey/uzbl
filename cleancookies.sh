#!/bin/sh

NOW=$(date +%s)
TMP=$(mktemp)
INPS="${HOME}/.local/share/uzbl/cookies.txt"

if [ ! 0 -eq $# ]; then INPS="$@"; fi

for inp in $INPS
do
    while read line
    do
        [ ${line:0:1} != "#" -a $(echo $line | awk '{print $5}') -ge $NOW ] \
            && echo $line
    done < $inp > $TMP

    mv $TMP $inp
done
