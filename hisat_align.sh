#!/bin/bash

genome_index="/media/goutham/B/Root/genome_index"
output_dir="/media/goutham/B/Root"
gtf_file="/media/goutham/B/Root/annotation.gtf"
fasta_file="/media/goutham/B/Root/genome.fna"

# Control samples (C)
samples_c=("C-4-R1A" "C-4-R2A" "C-4-R3A" "C-8-R1A" "C-8-R2A" "C-8-R3A" "C-16-R1A" "C-16-R2A" "C-16-R3A")

# Treatment samples (Fs)
samples_fs=("Fs-4-R1A" "Fs-4-R2A" "Fs-4-R3A" "Fs-8-R1A" "Fs-8-R2A" "Fs-8-R3A" "Fs-16-R1A" "Fs-16-R2A" "Fs-16-R3A")

# Loop through control samples
for sample in "${samples_c[@]}"; do
    fq1="/media/goutham/B/Root/${sample}_1.fq"
    fq2="/media/goutham/B/Root/${sample}_2.fq"
    sam="${output_dir}/${sample}.sam"
    
    hisat2 -x "${genome_index}" -1 "${fq1}" -2 "${fq2}" -S "${sam}" -p 40
done

# Loop through treatment samples
for sample in "${samples_fs[@]}"; do
    fq1="/media/goutham/B/Root/${sample}_1.fq"
    fq2="/media/goutham/B/Root/${sample}_2.fq"
    sam="${output_dir}/${sample}.sam"
    
    hisat2 -x "${genome_index}" -1 "${fq1}" -2 "${fq2}" -S "${sam}" -p 40
done

