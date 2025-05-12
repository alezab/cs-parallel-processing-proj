#!/bin/bash

# Usage: ./run_sbatch.sh [seq|par]

set -e

if [ $# -ne 1 ]; then
    echo "Usage: $0 [seq|par]"
    exit 1
fi

MODE=$1

case $MODE in
    seq)
        make clean && make sequential
        cd sequential
        jobid=$(sbatch seq.sh | awk '{print $4}')
    ;;
    par)
        make clean && make parallel
        cd parallel
        jobid=$(sbatch par.sh | awk '{print $4}')
    ;;
    *)
        echo "Invalid argument: $MODE. Use 'seq' or 'par'."
        exit 1
    ;;
esac

if [ -n "$jobid" ]; then
    echo "Submitted $MODE job with Job ID: $jobid"
    echo "squeue info:"
    squeue -j $jobid -u $USER
else
    echo "Failed to submit $MODE job."
fi
