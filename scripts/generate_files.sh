#!/bin/bash

grep -A 1 'NP_005557.1' $1 > LDHA.fa
head -100 $1 > 50seqs.fa
head -1000 $1 > 500seqs.fa
head -10000 $1 > 5000seqs.fa
head -50000 $1 > 25000seqs.fa
