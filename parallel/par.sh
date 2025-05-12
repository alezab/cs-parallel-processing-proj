#!/bin/bash -l
#SBATCH -p hpc-short
#SBATCH -N 1
#SBATCH --exclusive

#SBATCH -J par-gr4
#SBATCH -o ../slurm_out/slurm_par_%j.out

# Polecenia do wykonania:

# Informacje o systemie
source ../utils/system_info.sh

# Uruchomienie programu
echo "Running parallel program..."
./par.out