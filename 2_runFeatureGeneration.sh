#!/bin/bash -l
#SBATCH -N 1
#SBATCH --ntasks-per-node=1
#SBATCH -c 1
#SBATCH --time=0-12:00:00
#SBATCH -p bigmem

cd /scratch/users/dferrario/Adaptive-Cutsel-MILP 

micromamba activate adaptive_cutsel

export PYTHONPATH=$(pwd):$PYTHONPATH

# Generate the feature vectors for the following experiments, in the folder Features/
python Slurm/generate_feature_vectors.py TransformedInstances/ Features/ TempFiles/ Outfiles/ 1
