#!/usr/bin/bash

map_numper=$1
batch_file=$2

echo "Hi! I'm mapper number $map_numper, I got batch $batch_file" > /dev/stderr
words=(`cat $batch_file | sed 's/[^A-Za-z]/ /g' | tr '[:upper:]' '[:lower:]'`)

for word in ${words[@]}; do
	if [[ "$word" != "" ]]; then
	    echo "$word 1"
	fi
done
