#!/bin/bash
#SBATCH --nodes=1
#SBATCH --mem=600G
#SBATCH --time=144:00:00
#SBATCH -A ACF-UTK0011
#SBATCH --qos=long-bigmem
#SBATCH --partition=long-bigmem
#SBATCH --job-name=dram
#SBATCH --output=jobout-step1.o%j
#SBATCH --chdir=/lustre/isaac/scratch/zburcham/
#SBATCH --mail-user=zburcham@utk.edu
#SBATCH --mail-type=ALL

# load any modules needed to run your program  
# conda activate dram (activate before running job)

# Job
NPROC=$(nproc)
echo $NPROC

DRAM-setup.py prepare_databases \
	--output_dir ./DRAM_db \
	--kofam_hmm_loc db_files/kofam_profiles.tar.gz \
	--kofam_ko_list_loc db_files/kofam_ko_list.gz \
	--uniref_loc db_files/uniref90.fasta.gz \
	--pfam_loc db_files/Pfam-A.full.gz \
	--pfam_hmm_loc db_files/Pfam-A.hmm.dat.gz \
	--dbcan_loc db_files/dbCAN-HMMdb-V11.txt \
	--dbcan_fam_activities db_files/CAZyDB.08062022.fam-activities.txt \
	--vogdb_loc db_files/vog.hmm.tar.gz \
	--vog_annotations db_files/vog_annotations_latest.tsv.gz \
	--viral_loc db_files/viral.1.protein.faa.gz \
	--peptidase_loc db_files/merops_peptidases_nr.faa \
	--keep_database_files \
	--threads $NPROC
