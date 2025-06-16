#!/bin/bash
#SBATCH --partition=compute
#SBATCH --mem=100gb
#SBATCH --time=01:00:00
#SBATCH --ntasks-per-node=1
#SBATCH --job-name=collect

dir="$HOME/BATSwithCMAP/matchToBATS"
cd "$dir"

# Setup Environment
CONDA_BASE=$(conda info --base)
source $CONDA_BASE/etc/profile.d/conda.sh
conda activate CMAPenv

python $dir/collect.py >> output_dir/file.txt
