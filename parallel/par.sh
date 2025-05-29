#!/bin/bash -l
#SBATCH -p hpc-short 
#SBATCH -N 1 
#SBATCH --exclusive 
#SBATCH -J par-gr4
#SBATCH -o plik_wyjsciowy.txt

echo "Kompilacja programu..."
g++ -fopenmp test.c -o rownolegle

MAX_THREADS=24

echo "Start testow..."

for i in 1 2 4; do
    if [ "$i" -le "$MAX_THREADS" ]; then
        OMP_NUM_THREADS=$i ./rownolegle
    fi
done

if [ "$MAX_THREADS" -ge 8 ]; then
    i=8
    while [ "$i" -le "$MAX_THREADS" ]; do
	OMP_NUM_THREADS=$i ./rownolegle
	i=$((i+4))
    done
fi

echo "Testy zakonczone."
