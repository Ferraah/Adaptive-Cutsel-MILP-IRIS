#!/bin/bash -l
#SBATCH -N 1
#SBATCH --ntasks-per-node=16
#SBATCH -c 1
#SBATCH --time=0-12:00:00
#SBATCH -p batch
#SBATCH --output=SM-%x.%j.out
#SBATCH --error=SM-%x.%j.err

cd /scratch/users/dferrario/Adaptive-Cutsel-MILP 

module load lang/Python/3.8.6-GCCcore-10.2.0

micromamba activate venv

export PYTHONPATH=$(pwd):$PYTHONPATH

# Run SMAC on the transformed instances
# Last parameters are respectively: number of epochs and seed for experiment reproducibility
python Slurm/smac_runs.py TransformedInstances/Train/ TransformedInstances/Test/ TransformedSolutions/ RootResults/ SmacResults/ TempFiles Outfiles 250 667