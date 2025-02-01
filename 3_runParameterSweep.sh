#!/bin/bash -l
#SBATCH -N 1
#SBATCH --ntasks-per-node=16
#SBATCH -c 1
#SBATCH --time=0-12:00:00
#SBATCH -p batch
#SBATCH --output=PS-%x.%j.out
#SBATCH --error=PS-%x.%j.err

cd /scratch/users/dferrario/Adaptive-Cutsel-MILP 

module load lang/Python/3.8.6-GCCcore-10.2.0

micromamba activate venv

export PYTHONPATH=$(pwd):$PYTHONPATH

# Grid search on the transformed instances.
# The program tries all the possible combinations out of the 286 variable choices for the scoring rule, with granularity
# of 0.1 and sum 1.0. Takes a long time to run.
# Using just a few instances from the Test set, for testing purposes.
python Slurm/parameter_sweep.py TransformedInstances/Test TransformedSolutions/ Features/ RootResults/ FullResults/ FinalResults/ TempFiles/ Outfiles/ True 