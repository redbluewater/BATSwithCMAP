# BATSwithCMAP
Using CMAP (Python version) for BIOS-SCOPE data\
Krista Longnecker, 14 June 2025

## Updates as I go along, most recent at the top
### 16/17 June 2025
Already clear that I will need to run this on the HPC, so set up over there to run the scripts.

#### On desktop:
``git clone git@github.com:redbluewater/BATSwithCMAP.git`` (use SSH option and not GitHub CLI to make the required authentication possible)

#### For Poseidon:
Log into Poseidon ``ssh klongnecker@poseidon.whoi.edu``\
``git clone`` (GitHUB CLI version worked)\
``module load anaconda/5.1``\
``conda activate untargKL4`` # Need some form of conda environment to use conda (I don't think I need mamba)

But need to install pycmap : ``pip install pycmap``

Make a new environment:
``conda env export > CMAPenv.yml``\
(edit yml file to have the name CMAPenv at the top and bottom, I used nano on the HPC)\
``conda env create --file CMAPenv.yml``\
``conda activate CMAPenv.yml``

(put the config.py file with the API key into the .gitignore and manually swap that over)

Then run the scripts as follows:\
``sbatch ./step1_collect.slurm``\
``sbatch ./step2_colocalize.slurm``
``sbatch ./step3_compile.slurm``

Can also chain the jobs since step1 is fast, but step2 is not, but they need different parameters at the top of the slurm script:
* Start step1, and write down the batch job number (e.g., 14107426)
* Start step2, but with a dependancy:  sbatch --dependency=afterany:14107426 step2.slurm
Or, even better, only continue if step 1 worked:
* Start step2, but with a dependancy:  sbatch --dependency=afterok:14107426 step2.slurm

Set up one slurm script (``allSteps.slurm``) that runs the three slurm scripts, with dependencies, so I can start one script that has the details for each task.

#### To do
- [ ] consolidate API keys and config.py so I am not tracking multiple
- [ ] Make sure the API keys are in .gitignore


### 14 June 2025
Using the pycmap package because that seems to be more current than the R package (and looks like other authors wrote the R package).

Start with ``tryingCMAP_v1.ipynb`` to learn how to setup the queries and make some basic figures, for example: 
<img src="https://github.com/redbluewater/tryCMAP/blob/main/example_figure.jpg" width="50%" height = "50%">

Next up will be to gather data from different available datasets and match things up.

### Useful commands
seff to see efficiency of slurm script
This site is useful https://groups.oist.jp/scs/advanced-slurm
