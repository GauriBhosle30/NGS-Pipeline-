#!/bin/bash

# paths
DATA=../data
REF=../reference/ref.fa
RESULTS=../results

# output folders
mkdir -p $RESULTS/fastqc
mkdir -p $RESULTS/alignment

echo "Step 1: FastQC"
fastqc $DATA/Samplefile1.fastq -o $RESULTS/fastqc

echo "Step 2: Alignment using BWA"
bwa mem $REF $DATA/Samplefile1.fastq > $RESULTS/alignment/sample.sam

echo "Step 3: SAM to BAM"
samtools view -Sb $RESULTS/alignment/sample.sam > $RESULTS/alignment/sample.bam

echo "Step 4: Sort BAM"
samtools sort $RESULTS/alignment/sample.bam -o $RESULTS/alignment/sample.sorted.bam

echo "Pipeline completed successfully"
