#!/bin/bash -ue
bwa indexchr22.fa
bwa mem chr22.fa Sample1.fasta.fastq > aligned.sam
