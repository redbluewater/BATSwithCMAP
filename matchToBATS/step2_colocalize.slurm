#!/bin/bash
#SBATCH --partition=compute
#SBATCH --mem=100gb
#SBATCH --time=03:00:00
#SBATCH --ntasks-per-node=1
#SBATCH --job-name=coloc
#SBATCH --output=/vortexfs1/home/klongnecker/BATSwithCMAP/matchToBATS/output_dir/step2_colocalize.out
#SBATCH --error=/vortexfs1/home/klongnecker/BATSwithCMAP/matchToBATS/output_dir/step2_colocalize.error

dir="$HOME/BATSwithCMAP/matchToBATS"
cd "$dir"

# Setup Environment
CONDA_BASE=$(conda info --base)
source $CONDA_BASE/etc/profile.d/conda.sh
conda activate CMAPenv

python $dir/colocalize.py
