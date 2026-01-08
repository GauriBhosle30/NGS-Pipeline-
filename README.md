# NGS Pipeline (Up to Alignment & Variant Calling)

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
5. Variant calling (if applicable)

## How to run
cd scripts
./pipeline.sh

