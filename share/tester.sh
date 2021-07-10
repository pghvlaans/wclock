#!/bin/sh

while read -r f; do
	f="$(echo "$f" | cut -d'	' -f1)"
	echo "$f" >> wazzup
	wclock "$f" >> wazzup
done < extras
