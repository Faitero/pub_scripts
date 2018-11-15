#!/bin/bash
# Simple 3' demultiplex
#
#SBATCH --job-name=demult
## SBATCH --ntasks=6
## SBATCH -N 1              	# number of nodes
## SBATCH -n 12              	# number of cores
#SBATCH -t 2-00:00 # time (D-HH:MM)    # two days
#SBATCH --mem 32G                      # memory pool for all cores
#SBATCH --partition=compute
#
#SBATCH -o S.%A.out # STDOUT
#SBATCH -e S.%A.err # STDERR
#SBATCH --mail-type=END,FAIL # notifications for job done & fail
#SBATCH --mail-user=i.mozos@ucl.ac.uk # send-to address


# Demultiplex run
python demultiplex_3barcode_options.py /camp/lab/ulej/inputs/babs/martina.hallegger/robert.goldstone/PM18225/181108_D00446_0277_ACBT6YANXX/fastq/HAL169A1-A22_S1_L008_R1_001.fastq.gz iclip_annotation_PM18225_20181001_JU.xlsx

