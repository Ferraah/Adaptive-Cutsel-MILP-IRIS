#!/bin/bash -l
#SBATCH -N 1
#SBATCH --ntasks-per-node=16
#SBATCH -c 1
#SBATCH --time=0-12:00:00
#SBATCH -p batch
#SBATCH --output=SM-%x.%j.out
#SBATCH --error=SM-%x.%j.err

cd /scratch/users/dferrario/Adaptive-Cutsel-MILP 

micromamba activate adaptive_cutsel

export PYTHONPATH=$(pwd):$PYTHONPATH

# Train the neural network on the transformed instances.
# Make sure to split the transformed instances into Train and Test sets before running this script.
# epochs = 250: number of epochs to train the neural network
# rel_batch_size = 0.1: batch size is 10% of the training set size.
# num_samples = 20: number of samples used for each combination of instance and seed
# seed_init = 667: seed for experiment reproducibility
# one_at_a_time = False: The network is trained on all the instances at the same time.
python Slurm/train_neural_network.py TransformedInstances/Train/ TransformedInstances/Test/ TransformedSolutions/ Features RootResults/ ResultsGCNN/ Tensorboard/ TempFiles/ None Outfiles/ 250 0.1 20 667 False