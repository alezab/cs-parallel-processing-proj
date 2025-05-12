# Introduction to Parallel Processing of Multiprocessor Architectures

## UMCS Project 2025

This project demonstrates sequential and parallel implementations for performance comparison on multiprocessor architectures.

---

## Build Instructions

- **Compiler:** GNU g++ (with OpenMP support)
- **Build all targets:**
  ```bash
  make all
  ```
- **Build sequential only:**
  ```bash
  make sequential
  ```
- **Build parallel only:**
  ```bash
  make parallel
  ```
- **Clean build files:**
  ```bash
  make clean
  ```

---

## Running Jobs

Use the provided script to submit jobs to SLURM:

```bash
./run_sbatch.sh [seq|par]
```
- `seq`: Runs the sequential version
- `par`: Runs the parallel version

This script will build the selected target, submit the job to SLURM, and display the job status.

---

## SLURM Output

All SLURM output files (e.g., job logs) are stored in the `slurm_out/` directory.

---

## Directory Structure

- `sequential/` — Sequential implementation and scripts
- `parallel/` — Parallel implementation and scripts
- `slurm_out/` — SLURM output files
- `utils/` — Utility scripts

---

## Requirements
- Linux OS
- SLURM workload manager
- GNU g++ with OpenMP support

---

## License
See [LICENSE](LICENSE) for details.
