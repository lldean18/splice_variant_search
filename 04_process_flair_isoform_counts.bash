#!/bin/bash
# Laura Dean
# 6/11/25
# script written for running on the UoN HPC Ada

# Script to process FLAIR quantify output to determine the relative expression
# of the different splice variants of a gene in this cancer RNAseq dataset

# this script will need an install of NCBI ntres direct tools
# install and add path to .bashrc with the following
# download and install
#sh -c "$(curl -fsSL https://ftp.ncbi.nlm.nih.gov/entrez/entrezdirect/install-edirect.sh)"
# add to your PATH (so efetch and friends are usable)
#export PATH=${PATH}:${HOME}/edirect

# set variables
wkdir=/gpfs01/home/mbzlld/data/splice_variant_search
reference=$wkdir/GCF_000001405.40_GRCh38.p14_genomic.fna
annotation=$wkdir/GCF_000001405.40_GRCh38.p14_genomic.gtf
gene_of_interest=KCNMA1

cd $wkdir


## sum across replicates of the same sample (which in this case is all of them)
#awk '{for(i=2;i<=NF;i++) a[$1]+=$i} END{for(k in a) print k,a[k]}' flair.quantify.counts.tsv > flair.quantify.counts.summed.tsv

## extract only the splice variants for the gene of interest
#grep -i $gene_of_interest flair.quantify.counts.summed.tsv > ${gene_of_interest}.flair.quantify.counts.summed.tsv




# set variables
wkdir=/gpfs01/home/mbzlld/data/splice_variant_search
reference=$wkdir/GCF_000001405.40_GRCh38.p14_genomic.fna
annotation=$wkdir/GCF_000001405.40_GRCh38.p14_genomic.gtf
gene_of_interest=KCNMA1

cd $wkdir


## sum across replicates of the same sample (which in this case is all of them)
#awk '{for(i=2;i<=NF;i++) a[$1]+=$i} END{for(k in a) print k,a[k]}' flair.quantify.counts.tsv > flair.quantify.counts.summed.tsv

## extract only the splice variants for the gene of interest
#grep -i $gene_of_interest flair.quantify.counts.summed.tsv > ${gene_of_interest}.flair.quantify.counts.summed.tsv

# extract the refseq accessions for the splice variants


# fetch nucleotide FASTA for one accession
efetch -db nuccore -id NM_001271521.2 -format fasta > NM_001271521.2.fa

# fetch GenBank flatfile (includes exon/CDS annotations & descriptive text)
efetch -db nuccore -id NM_001271521.2 -format gb > NM_001271521.2.gb
