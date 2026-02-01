process VARIANT_CALL {

    tag "$sample_id"
    publishDir "${params.outdir}/vcf", mode: 'copy'

    input:
    tuple val(sample_id), path(bam), path(bai)
    path ref

    output:
    path "${sample_id}.vcf"

    script:
    """
    # Make sure reference is indexed
    ${params.samtools} faidx ${ref}

   
    ${params.samtools} mpileup -f ${ref} ${bam} -Ou | \
    ${params.bcftools} call -mv -Ov -o ${sample_id}.vcf
    """
}
