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

# Modules Load
ml cutadapt/1.9.1-foss-2016b-Python-2.7.12 
ml use /camp/apps/eb/dev/modules/all
ml Python/2.7.12-foss-2016b
ml R-bundle-cnvkit/0.2-foss-2016b-R-foss-2016b-3.3.1-bioc-3.3-libX11-1.6.3


# Demultiplex run
python demultiplex_3barcode_options.py /camp/lab/ulej/inputs/babs/martina.hallegger/robert.goldstone/PM18225/181108_D00446_0277_ACBT6YANXX/fastq/HAL169A1-A22_S1_L008_R1_001.fastq.gz iclip_annotation_PM18225_20181001_JU.xlsx

