#!/bin/bash
# Laura Dean
# 11/7/25
# script written for running on the UoN HPC Ada

#SBATCH --job-name=flair_splice_variant_search
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=30g
#SBATCH --time=48:00:00
#SBATCH --output=/gpfs01/home/mbzlld/code_and_scripts/slurm_out_scripts/slurm-%x-%j.out



# set variables
wkdir=/gpfs01/home/mbzlld/data/splice_variant_search
reference=$wkdir/GCF_000001405.40_GRCh38.p14_genomic.fna
annotation=$wkdir/GCF_000001405.40_GRCh38.p14_genomic.gtf
bam=$wkdir/bams_from_hpc/GIN44_DMSO_merged.bam
fastqs=

cd $wkdir


# activate software
source $HOME/.bash_profile
#conda create --name flair bioconda::flair -y
conda activate flair


# convert bam to bed12 format
bam2Bed12 -i $bam

# flair correct - corrects misaligned splice sites using genome annotations
flair correct \
	--query ${bam%.*}.bed12 \
	--gtf $annotation \
	--genome $reference \
	--threads 8

# flair collapse - Defines high-confidence isoforms from corrected reads
flair collapse \
	--genome $reference \
	--gtf $annotation \
	--query ${bam%.*}.bed12 \
	--reads $fastqs \
	--generate_map \
	--check_splice \
	--stringent \
	--annotation_reliant generate

# flair quantify - 
flair quantify \
	--isoforms ? \
	--reads_manifest ?

# flair diffsplice - 



# deactivate software
conda deactivate


