#!/bin/bash -l
#SBATCH -p hpc-short
#SBATCH -N 1
#SBATCH --exclusive

#SBATCH -J par-gr4
#SBATCH -o ../slurm_out/slurm_par_%j.out

# Polecenia do wykonania:

# Informacje o systemie
source ../utils/system_info.sh
echo

MAX_THREADS=$total_cores

echo "Start tests..."
echo

# Uruchomienie programu co 2 rdzenie
for i in 1 2 4; do
    if [ "$i" -le "$MAX_THREADS" ]; then
        OMP_NUM_THREADS=$i ./par.out
    fi
done

# Uruchomienie programu co 4 rdzenie do liczby rdzeni fizycznych
if [ "$MAX_THREADS" -ge 8 ]; then
    i=8
    while [ "$i" -le "$MAX_THREADS" ]; do
        OMP_NUM_THREADS=$i ./par.out
        i=$((i+4))
    done
fi

echo "Tests ended."
