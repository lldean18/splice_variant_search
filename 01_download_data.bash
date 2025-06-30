#!/bin/bash

# start an interactive compute job
srun --partition defq --cpus-per-task 1 --mem 30g --time 48:00:00 --pty bash

# create a tmux session
source $HOME/.bash_profile
conda activate tmux
tmux new -s download

# start the data pull command
rsync -rvh --progress smaug:/data/test_data/simon_RNA/bams_from_hpc /gpfs01/home/mbzlld/data/splice_variant_search/Simons_data/

# cntrl+d to detatch from the tmux window while the command is running

# once download is complete
exit
conda deactivate


