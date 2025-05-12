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

## Insertion Sort Algorithm

This project uses the **insertion sort** algorithm in its sequential and parallel implementations. Insertion sort is a simple, comparison-based sorting algorithm that builds the final sorted array one item at a time. It is efficient for small datasets and is often used as a base case in more complex sorting algorithms.

- **Time Complexity:** O(n²). For large datasets, insertion sort is not the most efficient choice, but it can be parallelized on small data fragments for educational purposes.
- **Data Type:** The algorithm operates on arrays of integers.

**Algorithm Steps:**
1. Iterate from the second element to the end of the array.
2. For each element, compare it with the elements before it.
3. Shift larger elements one position to the right to make space.
4. Insert the current element into its correct position.

Insertion sort is chosen for its simplicity and ease of parallelization for demonstration purposes.

---

## Requirements
- Linux OS
- SLURM workload manager
- GNU g++ with OpenMP support

---

## License
See [LICENSE](LICENSE) for details.
