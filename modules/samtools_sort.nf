process SAMTOOLS_SORT {

    tag "$sample_id"
    publishDir "${params.outdir}/bam", mode: 'copy'

    input:
    tuple val(sample_id), path(sam)

    output:
    tuple val(sample_id), path("${sample_id}.bam")

    script:
    """
    ${params.samtools} sort -o ${sample_id}.bam ${sam}
    """
}
