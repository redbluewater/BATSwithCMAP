#!/bin/bash
#SBATCH --partition=compute
#SBATCH --mem=1gb
#SBATCH --time=0:30:00
#SBATCH --ntasks-per-node=1
#SBATCH --job-name=compile
#SBATCH --mail-type=END
#SBATCH --mail-user=klongnecker@whoi.edu
#SBATCH --output=/vortexfs1/home/klongnecker/BATSwithCMAP/matchToBATS/output_dir/step3.out
#SBATCH --error=/vortexfs1/home/klongnecker/BATSwithCMAP/matchToBATS/output_dir/step3.error


dir="$HOME/BATSwithCMAP/matchToBATS"
cd "$dir"

echo `date`
echo This is job $SLURM_JOB_ID

# Setup Environment
CONDA_BASE=$(conda info --base)
source $CONDA_BASE/etc/profile.d/conda.sh
conda activate CMAPenv

python $dir/compiler.py 
