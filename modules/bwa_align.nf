process BWA_ALIGN {

    tag "$sample_id"
    publishDir "${params.outdir}/alignment", mode: 'copy'

    input:
    tuple val(sample_id), path(reads)
    path ref

    output:
    tuple val(sample_id), path("${sample_id}.sam")

    script:
    """
    ${params.bwa} index ${ref}
    ${params.bwa} mem ${ref} ${reads} > ${sample_id}.sam
    """
}

