#!/bin/bash
# Laura Dean
# 11/7/25
# script written for running on the UoN HPC Ada

#SBATCH --job-name=flair_splice_variant_search
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=200g
#SBATCH --time=60:00:00
#SBATCH --output=/gpfs01/home/mbzlld/code_and_scripts/slurm_out_scripts/slurm-%x-%j.out



# set variables
wkdir=/gpfs01/home/mbzlld/data/splice_variant_search
reference=$wkdir/GCF_000001405.40_GRCh38.p14_genomic.fna
annotation=$wkdir/GCF_000001405.40_GRCh38.p14_genomic.gtf
#bam=$wkdir/bams_from_hpc/SF188_DMSO_merged.bam
fastqs=$wkdir/ds1239_SF188_DMSO_RNA/20241107_1347_P2S-01121-B_PBA03961_2b1a6105/fastq_pass/*
fastqs2=/gpfs01/home/mbzlld/data/splice_variant_search/ds1239_SF188_DMSO_RNA/20241110_1301_P2S-01121-B_PBA03961_ac423a17/fastq_pass/*
manifest=/gpfs01/home/mbzlld/data/splice_variant_search/manifest.tsv

cd $wkdir


# activate software
source $HOME/.bash_profile

## first index the bam file with samtools
#conda activate samtools1.22
#samtools index --threads 8 -M $bam
#conda deactivate

#conda create --name flair bioconda::flair -y
conda activate flair

# not doing this now as just using the raw fastq reads directly for now
# convert bam to bed12 format
#bam2Bed12 -i $bam > ${bam%.*}.bed

## flair align - aligns reads to the genome using minimap2, and converts the SAM output to BED12
#flair align \
#	--genome $reference \
#	--threads 8 \
#	--reads $fastqs $fastqs2

## flair correct - corrects misaligned splice sites using genome annotations
#flair correct \
#	--query flair.aligned.bed \
#	--gtf $annotation \
#	--genome $reference \
#	--threads 8

## flair collapse - Defines high-confidence isoforms from corrected reads
#flair collapse \
#	--genome $reference \
#	--gtf $annotation \
#	--query flair_all_corrected.bed \
#	--reads $fastqs $fastqs2 \
#	--generate_map \
#	--check_splice \
#	--stringent \
#	--annotation_reliant generate

# flair quantify - 
flair quantify \
	--isoforms flair.collapse.isoforms.fa \
	--reads_manifest $manifest


# flair diffsplice - 



# deactivate software
conda deactivate


