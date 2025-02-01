#!/bin/bash -l
#SBATCH -N 1
#SBATCH --ntasks-per-node=1
#SBATCH -c 1
#SBATCH --time=0-12:00:00
#SBATCH -p bigmem

cd /scratch/users/dferrario/Adaptive-Cutsel-MILP 

module load lang/Python/3.8.6-GCCcore-10.2.0

micromamba activate venv

export PYTHONPATH=$(pwd):$PYTHONPATH

# Generate the feature vectors for the following experiments, in the folder Features/
python Slurm/generate_feature_vectors.py TransformedInstances/ Features/ TempFiles/ Outfiles/ 1
