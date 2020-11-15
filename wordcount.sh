#!/usr/bin/bash

file=$1


batches_dir=".batches"
rm -r $batches_dir 2> /dev/null
mkdir $batches_dir

n=0

split -l 1000 -a 3 "$file" "$batches_dir/"

batches=(`ls $batches_dir`)
result=()

for b in ${batches[@]}; do
	res="`./map.sh $n $batches_dir/$b &`"
	result+=("$res")
	n=$((n + 1))
done

for ((i=0 ; i < $n ; i++)) do
	wait
done

echo "All mappers done" > /dev/stderr

echo "${result[@]}" | sort | ./reduce | sort -k2 -n -r


rm -r $batches_dir