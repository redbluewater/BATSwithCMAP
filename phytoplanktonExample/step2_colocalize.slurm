#!/bin/bash
#SBATCH --partition=medmem
#SBATCH --mem=20gb
#SBATCH --qos=unlim
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --job-name=coloc
#SBATCH --output=/vortexfs1/home/klongnecker/BATSwithCMAP/phytoplanktonExample/output_dir/step2.out
#SBATCH --error=/vortexfs1/home/klongnecker/BATSwithCMAP/phytoplanktonExample/output_dir/step2.error

dir="$HOME/BATSwithCMAP/matchToBATS"
cd "$dir"

echo `date`
echo This is job $SLURM_JOB_ID

# Setup Environment
CONDA_BASE=$(conda info --base)
source $CONDA_BASE/etc/profile.d/conda.sh
conda activate CMAPenv

python $dir/colocalize.py
