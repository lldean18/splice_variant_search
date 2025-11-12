
######## SET UP ENVIRONMENT ###########

# load env settings
source $HOME/.bash_profile

# activate conda env sith blast install
conda activate phylogeny

# move to working directory
cd /gpfs01/home/mbzlld/data/splice_variant_search





########## PERFORM TASKS #############

# make a blast database from a fasta file of splice variants
makeblastdb -dbtype nucl -in KCNMA1.variant.sequences.fa -parse_seqids -out KCNMA1_variant_blast_db

# blast the query primer sequences against the database
blastp -query mouse_STREX_primers.fasta -db KCNMA1_variant_blast_db -outfmt '6 sseqid' -evalue 1e-5 -out KCNMA1_variant_blast_output.txt

