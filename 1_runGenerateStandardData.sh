#!/bin/bash -l
#SBATCH -N 1
#SBATCH --ntasks-per-node=1
#SBATCH -c 1
#SBATCH --time=0-12:00:00
#SBATCH -p bigmem
#SBATCH --output=GS-%x.%j.out
#SBATCH --error=GS-%x.%j.err

cd /scratch/users/dferrario/Adaptive-Cutsel-MILP 

module load lang/Python/3.8.6-GCCcore-10.2.0

micromamba activate venv

export PYTHONPATH=$(pwd):$PYTHONPATH

# Generate the standard data for the following experiments

# Firstly, download instances and solutions and put them in the right folders,
# for example a restricted part of MIPLIB that we call 
# MiniMIPLIB2017/Instances/ and MiniMIPLIB2017/Solutions/

# Run on IRIS cluster, using bigmem partition (it would crash otherwise)

# Last 3 parameters:
# files_compressed = True (They are .gz)
# files_are_lps = False (They are .mps)
# solution_dir_is_empty = False (We already have solutions in the provided folder)
python Slurm/generate_standard_data.py MiniMIPLIB2017/Instances/ MiniMIPLIB2017/Solutions/ TransformedInstances/ TransformedSolutions/ RootResults/ FullResults/ TempFiles/ Outfiles/ 1 True False False
