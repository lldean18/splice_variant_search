#!/bin/bash
# code to download the bams from Smaug to Ada
# needed the fastq files in the end for flair rather than the bams
# so added the code to pull the fastqs from balrog (mounted from elrond) to Ada

# create a tmux session
source $HOME/.bash_profile
conda activate tmux
tmux new -s download


# start an interactive compute job
srun --partition defq --cpus-per-task 1 --mem 70g --time 160:00:00 --pty bash


## start the data pull command for the bams
#rsync -rvh --progress smaug:/data/test_data/simon_RNA/bams_from_hpc /gpfs01/home/mbzlld/data/splice_variant_search/

# start the data pull command for the fastqs
# removed the real username and IP address for security
rsync -rvhc --progress balrogusername@balrogipaddress:/share/NFSv=4/deepseq/IntraopBackup/ds1239_SF188_DMSO_RNA ./
# I think Simon has changed the organisation of the directory I copied from now.
# files are now in:
# /share/NFSv=4/deepseq/IntraopBackup/ds1239/cell_lines/


# cntrl+b, then d to detatch from the tmux window while the command is running

# once download is complete
exit
conda deactivate


