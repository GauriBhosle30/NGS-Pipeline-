# NGS Variant Calling Pipeline (Nextflow DSL2)

This repository contains a modular NGS variant calling pipeline built using Nextflow DSL2.

## Input files
- Sample1.fasta.fastq
- chr22.fa

## Steps
1. Quality control (FastQC)
2. Alignment to reference genome (BWA)
3. SAM to BAM conversion and sorting (SAMtools)
4. Variant calling (bcftools)

## How to run
```bash
nextflow run main.nf

