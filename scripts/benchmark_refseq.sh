#!/bin/bash


for t in 15 8 4 2 1
do
for p in $(ls ./data/*)
do
echo "$p $t"
echo "$p $t" >> ./output/times.txt
/usr/bin/time -f "%e" -o ./output/times.txt -a blastp -query $p -db /data/refseq_protein/refseq_protein -outfmt 6 -out tmp.blast -num_threads $t
done
done
