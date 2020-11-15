#!/usr/bin/bash

expected=`cat first_connet_sorted`
actual=`./wordcount.sh First\ sonnet.txt`

if [[ "$actual" == "$expected" ]]; then
	echo "SUCCESS"
else
	echo "FAIL"
fi