process VARIANT_CALL {

    publishDir "results/variants", mode: 'copy'


    input:
    path bam
    path ref

    output:
    path "variants.vcf"

    script:
    """
    samtools mpileup -uf ${ref} ${bam} > variants.bcf
    bcftools call -mv -Ov variants.bcf > variants.vcf
    """
}
