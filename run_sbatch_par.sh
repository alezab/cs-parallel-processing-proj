#!/bin/bash

# Zmiana katalogu roboczego na katalog skryptu
cd "$(dirname "$0")"

# Skompiluj przed uruchomieniem
make clean && make parallel

# Zmiana katalogu roboczego na katalog równoległy
cd parallel

# Stworzenie katalogu slurm, jeśli nie istnieje
mkdir -p slurm

# Odpal skrypt równoległy przez sbatch
jobid=$(sbatch parallel/par.sh | awk '{print $4}')

# Wyświetl job ID i użytkownika
if [ -n "$jobid" ]; then
    echo "Submitted parallel job with Job ID: $jobid"
    echo "squeue info:"
    squeue -j $jobid -u $USER
else
    echo "Failed to submit parallel job."
fi