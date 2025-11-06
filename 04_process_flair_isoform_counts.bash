#!/bin/bash
# Laura Dean
# 3/11/25
# script written for running on the UoN HPC Ada

# Script to process FLAIR quantify output to determine the relative expression
# of the different splice variants of a gene in this cancer RNAseq dataset

#SBATCH --job-name=flair_process
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=5g
#SBATCH --time=00:30:00
#SBATCH --output=/gpfs01/home/mbzlld/code_and_scripts/slurm_out_scripts/slurm-%x-%j.out



# set variables
wkdir=/gpfs01/home/mbzlld/data/splice_variant_search
reference=$wkdir/GCF_000001405.40_GRCh38.p14_genomic.fna
annotation=$wkdir/GCF_000001405.40_GRCh38.p14_genomic.gtf
gene_of_interest=KCNMA1

cd $wkdir


## sum across replicates of the same sample (which in this case is all of them)
#awk '{for(i=2;i<=NF;i++) a[$1]+=$i} END{for(k in a) print k,a[k]}' flair.quantify.counts.tsv > flair.quantify.counts.summed.tsv

# extract only the splice variants for the gene of interest
grep -i $gene_of_interest flair.quantify.counts.summed.tsv > ${gene_of_interest}.flair.quantify.counts.summed.tsv


