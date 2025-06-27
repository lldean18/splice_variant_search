#!/bin/bash

# start an interactive compute job
srun --partition defq --cpus-per-task 1 --mem 30g --time 48:00:00 --pty bash

# create a tmux session
source $HOME/.bash_profile
conda activate tmux
tmux new -s download

# start the data pull command
rsync -rvh --progress smaug:~/camel_flye.bash ~/smaugtest.bash

# cntrl+d to detatch from the tmux window while the command is running

# once download is complete
exit
conda deactivate


