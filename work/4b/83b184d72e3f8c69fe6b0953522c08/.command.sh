#!/bin/bash -ue
samtools view -Sb aligned.sam |samtools sort -o sorted.bam
samtools index sorted.bam
