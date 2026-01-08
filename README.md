# NGS Pipeline (Up to Alignment)

This repository contains a basic single-end NGS pipeline.

## Input files
- Samplefile1.fastq

## Reference genome
- ref.fa (user-provided)

## Steps performed
1. Quality control using FastQC
2. Alignment using BWA
3. SAM to BAM conversion
4. BAM sorting

## How to run
cd scripts
./pipeline.sh
