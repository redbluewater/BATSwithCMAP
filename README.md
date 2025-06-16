# BATSwithCMAP
Using CMAP (Python version) for BIOS-SCOPE data\
Krista Longnecker, 14 June 2025

## Updates as I go along, most recent at the top
### 16 June 2025
Already clear that I will need to run this on the HPC, so set up over there to run the scripts.

#### On desktop:
``git clone git@github.com:redbluewater/BATSwithCMAP.git`` (use SSH option and not GitHub CLI to make the required authentication possible)

#### For Poseidon:
Log into Poseidon ``ssh klongnecker@poseidon.whoi.edu``\
``git clone`` (GitHUB CLI version worked)\
``module load anaconda/5.1``\
``conda activate untargKL4``

But need to install pycmap : ``pip install pycmap``

Make a new environment:
``conda env export > CMAPenv.yml``\
(edit yml file to have the name RforMStools6 at the top and bottom, I used nano on the HPC)\
``conda env create --file CMAPenv.yml``\
``conda activate CMAPenv.yml``

(put the config.py file with the SSH key into the .gitignore and manually swap that over)

Then run the scripts as follows:\
``sbatch ./step1_collect.slurm``\
``sbatch ./step2_colocalize.slurm``
``sbatch ./step3_compile.slurm``


### 14 June 2025
Using the pycmap package because that seems to be more current than the R package (and looks like other authors wrote the R package).

Start with ``tryingCMAP_v1.ipynb`` to learn how to setup the queries and make some basic figures, for example: 
<img src="https://github.com/redbluewater/tryCMAP/blob/main/example_figure.jpg" width="50%" height = "50%">

Next up will be to gather data from different available datasets and match things up.

