#!/bin/bash


# create a tmux session
source $HOME/.bash_profile
conda activate tmux
tmux new -s download


# start an interactive compute job
srun --partition defq --cpus-per-task 1 --mem 70g --time 160:00:00 --pty bash


# start the data pull command
rsync -rvh --progress smaug:/data/test_data/simon_RNA/bams_from_hpc /gpfs01/home/mbzlld/data/splice_variant_search/

# cntrl+b, then d to detatch from the tmux window while the command is running

# once download is complete
exit
conda deactivate


