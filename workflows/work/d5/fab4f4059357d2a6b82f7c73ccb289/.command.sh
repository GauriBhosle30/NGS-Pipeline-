#!/bin/bash -ue
/home/user_gauri/miniconda3/envs/bnf/bin/bwa index chr22.fa
/home/user_gauri/miniconda3/envs/bnf/bin/bwa mem chr22.fa sample_trimmed.fastq > sample_aligned.sam
