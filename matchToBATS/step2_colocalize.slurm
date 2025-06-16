#!/bin/bash
#SBATCH --partition=compute
#SBATCH --mem=100gb
#SBATCH --time=03:00:00
#SBATCH --ntasks-per-node=1
#SBATCH --job-name=coloc

dir="$HOME/BATSwithCMAP/matchToBATS"
cd "$dir"

# Setup Environment
CONDA_BASE=$(conda info --base)
source $CONDA_BASE/etc/profile.d/conda.sh
conda activate CMAPenv

python $dir/colocalize.py
