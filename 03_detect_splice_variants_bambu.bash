#!/bin/bash
# Laura Dean
# 11/7/25
# script written for running on the UoN HPC Ada

#SBATCH --job-name=bambu_splice_variant_search
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=30g
#SBATCH --time=48:00:00
#SBATCH --output=/gpfs01/home/mbzlld/code_and_scripts/slurm_out_scripts/slurm-%x-%j.out




# activate software
source $HOME/.bash_profile
#conda create --name bambu bioconda::bioconductor-bambu -y
conda activate bambu

wkdir=/gpfs01/home/mbzlld/data/splice_variant_search
cd $wkdir

R
library(bambu)

# Run bambu
se <- bambu(reads = "./bams_from_hpc/GIN44_DMSO_merged.bam", annotations = "./GCF_000001405.40_GRCh38.p14_genomic.gtf", genome = "./GCF_000001405.40_GRCh38.p14_genomic.fna", stranded = T, ncore=8)
# write the results out of R
writeBambuOutput(se, path = "./bambu/")



# deactivate software
conda deactivate


