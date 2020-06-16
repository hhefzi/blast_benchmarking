#!/bin/bash


for p in $(ls ./data/*)
do
for t in 1 2 4 8 15
do
echo "$p $t"
echo "$p $t" >> ./output/times.txt
/usr/bin/time -f "%e" -o ./times.txt -a blastp -query $p -db /data/cho_protein/GCF_003668045.1_CriGri-PICR_protein.faa -outfmt 6 -out tmp.blast -num_threads $t
done
done
