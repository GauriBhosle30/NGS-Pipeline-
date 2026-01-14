#!/bin/bash -ue
samtools mpileup -uf chr22.fa sorted.bam > variants.bcf
bcftools call -mv -Ov variants.bcf > variants.vcf
