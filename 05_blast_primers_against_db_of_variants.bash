
# load env settings
source $HOME/.bash_profile

# activate conda env sith blast install
conda activate phylogeny


# make a blast database from a fasta file of splice variants
makeblastdb -dbtype prot -in SubjectFile.fasta -parse_seqids -out blast_db


