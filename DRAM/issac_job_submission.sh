#!/bin/bash
#SBATCH --nodes=1
#SBATCH --time=4:00:00
#SBATCH -A ACF-UTK0011
#SBATCH --qos=campus
#SBATCH --partition=campus
#SBATCH --ntasks-per-node=4
#SBATCH --job-name=dram
#SBATCH --output=jobout-step1.o%j
#SBATCH --chdir=/lustre/isaac/scratch/zburcham/projects/
#SBATCH --mail-user=zburcham@utk.edu
#SBATCH --mail-type=ALL

# load any modules needed to run your program  
#conda activate DRAM

# Job

#DRAM.py annotate -i './pangenome/genome_assemblies_genome_fasta/ncbi-genomes-2023-07-07/*.fna' -o 'pangenome/annotation' --threads 24

DRAM.py distill -i 'pangenome/annotation/annotations.tsv' -o 'pangenome/genome_summaries' --trna_path 'pangenome/annotation/trnas.tsv' --rrna_path 'pangenome/annotation/rrnas.tsv'
