#!/bin/bash -l
#SBATCH -p hpc-short
#SBATCH -N 1
#SBATCH --exclusive

#SBATCH -J seq-gr4
#SBATCH -o slurm/seq.txt

# Polecenia do wykonania:

# Informacje o systemie
source ../system_info.sh

# Uruchomienie programu
echo "Running sequential program..."
./seq.out
