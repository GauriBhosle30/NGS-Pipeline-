process SAMTOOLS_INDEX {

    tag "$sample_id"
    publishDir "${params.outdir}/bam_indexed", mode: 'copy'

    input:
    tuple val(sample_id), path(bam)

    output:
    tuple val(sample_id), path(bam), path("${bam}.bai")  
    script:
    """
    ${params.samtools} index ${bam}
    """
}
