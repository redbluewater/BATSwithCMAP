#!/bin/bash
#SBATCH --partition=compute
#SBATCH --mem=100gb
#SBATCH --time=03:00:00
#SBATCH --ntasks-per-node=1
#SBATCH --job-name=coloc

dir="$HOME/BATSwithCMAP/matchToBATS"
cd "$dir"

#use a folder for the output so they don't fill up the primary folder
out_dir="$dir/output_dir/$SLURM_JOB_NAME" 
if [ ! -d "$out_dir" ]; then
    mkdir -p "$out_dir"
fi


# Setup Environment
CONDA_BASE=$(conda info --base)
source $CONDA_BASE/etc/profile.d/conda.sh
conda activate CMAPenv

python $dir/colocalize.py > $out_dir
