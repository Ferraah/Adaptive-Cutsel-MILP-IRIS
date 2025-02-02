#!/bin/bash -l
#SBATCH -N 1
#SBATCH --ntasks-per-node=1
#SBATCH -c 1
#SBATCH --time=0-12:00:00
#SBATCH -p batch
#SBATCH --output=SM-%x.%j.out
#SBATCH --error=SM-%x.%j.err

cd /scratch/users/dferrario/Adaptive-Cutsel-MILP 

micromamba activate adaptive_cutsel

export PYTHONPATH=$(pwd):$PYTHONPATH

# Pick a model (e.g., actor_109.pt) and evaluate it on the Test set.
python Slurm/evaluate_trained_network.py TransformedInstances/Test TransformedSolutions Features/ RootResults/ ResultsGCNN/ Tensorboard/ TempFiles/ ResultsGCNN/actor_109.pt Outfiles True 