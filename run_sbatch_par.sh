#!/bin/bash

# Skompiluj przed uruchomieniem
make clean && make parallel

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