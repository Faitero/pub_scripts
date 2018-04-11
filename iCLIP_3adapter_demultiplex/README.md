# iCLIP 3'barcode demultiplex

Script process and demultiplex the raw fastq file inserting the 3'barcode in between the 5' barcode.

## Main call:

    ./demultiplex_3barcode.py multiplexed_reads.fq.gz sample_annotation.xlsx

    Optional arguments:

    -o --output_folder  Path of output folder. If not expecified all the output will go to the path where you call script
    -r --remove         Boolean to remove intermediate files (yes or no). Default "yes"
    -M --max_lenght     Max length of sequencing read. Default 200 (integer)
    -m --min_lenght     Min length of sequencing read. Default 1 (integer)

## Requirement:

demultiplex_3barcode.py needs "Make_histogram.R" Rscript to be present on the same folder of main script

## Info:
<pre>
- Adapters
5'barcode                   NNNNAAAAANNN
3'Illumina adapter                                                     3ILLUMINAADAPTER
3'barcode                                                         NNTGC

- Reads
Normal read                 NNNNAAAAANNN.........SEQUENCE..............3ILLUMINAADAPTER
New 3'barcode read          NNNNAAAAANNN.........SEQUENCE.........NNTGC3ILLUMINAADAPTER

- Output reads
Transformed upstream        NNNNNNTGCAAAAANNN....SEQUENCE..............3ILLUMINAADAPTER
Transformed downstream      NNNNAAAAATGCNNNNN....SEQUENCE..............3ILLUMINAADAPTER

</pre>

## Process scheme and output demultiplexed file names: 
<pre>

1. Remove the 3' Illumina adapter:

    - Output:       Illumina_adapter3_removed.fq.gz                                     Reads removing the 3' Illumina adapter
                    Illumina_unknown_removed.fq.gz                                      Reads where 3' Illumina adapter can't be found

2. Demultiplex based on the 5' barcode:

    - Output:       demultiplexed_5barcode_{5'barcode_name}.fq                          Reads 5'barcode demultiplexed
                    5barcode_not_found.fastq.gz                                         Reads where 5'barcode can't be found


3. Demultiplex based on the 3'barcode and intercalate in between the 5'barcode and add a syntetic 3' Illumina adapter:

    - Output:        demultiplexed_5barcode_{5'barcode_name}_Illumina_3adapter_added.fq 

                     demultiplexed_5barcode_{5'barcode_name}_demultiplexed_3barcode_{3'barcodes_name}_Illumina_3adapter_added.fq

                     fastqfilename_cutadapt_Logfile.txt                                  Cutadapt Log of demultiplex and extraction

4. Create histograms of read length

    - Output:       Histogram{5'barcode_name}.pdf                                       Histograms of read lengths containing 3'barcodes

5. Remove intermediate files and merge the final file:

    - Output:         L3modified_merged_{name_original_fastq_file}.fq.gz                 Final 3barcode demultiplexed and merged all the intermediate files

6. Modified sample_annotation file:

    - Output:         L3modified_{name_original_excel_file}.xlsx                         Final annotation file where 3'barcode have been intercalated in between the 5'barcode

</pre>
