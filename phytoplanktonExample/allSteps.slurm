#!/bin/bash

# first, we submit the original job, and capture the output. 
# Slurm prints "submitted batch job <jobid>" when we submit a job.
# We store that output in jobstring using $( ... )

jobstring=$(sbatch step1_collect.slurm)

# The last word in jobstring is the job ID. There are several ways to get it,
# but the shortest is with parameter expansion: ${jobstring##* }

jobid=${jobstring##* }

# Now submit step2.slurm as a dependant job to step1:
# sbatch --dependency=afterok:${jobid} step2_colocalize.slurm
jobstring=$(sbatch --dependency=afterok:${jobid} step2_colocalize.slurm)
jobid=${jobstring##* }

# Finally, assume all goes OK, setup step3
sbatch --dependency=afterok:${jobid} step3_compile.slurm

