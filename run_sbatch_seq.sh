#!/bin/bash

# Skompiluj przed uruchomieniem
make clean && make sequential

# Odpal skrypt sekwencyjny przez sbatch
jobid=$(sbatch sequential/seq.sh | awk '{print $4}')

# Wyświetl job ID i użytkownika
if [ -n "$jobid" ]; then
    echo "Submitted sequential job with Job ID: $jobid"
    echo "squeue info:"
    squeue -j $jobid -u $USER
else
    echo "Failed to submit sequential job."
fi