
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

# blast the query STREX primer sequences against the database
blastn -query mouse_STREX_primers.fasta -db KCNMA1_variant_blast_db -task blastn-short -out KCNMA1_variant_blast_output.txt

#-outfmt '6 qseqid sseqid evalue length pident'


# blast the query non-STREX primer sequences against the database
blastn -query mouse_ZERO_primers.fasta -db KCNMA1_variant_blast_db -task blastn -out KCNMA1_variant_ZERO_blast_output.txt





