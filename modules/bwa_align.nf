process BWA_ALIGN {

    publishDir "results/alignment", mode: 'copy'



    input:
    path reads
    path ref

    output:
    path "aligned.sam"

    script:
    """
    bwa index ${ref}
    bwa mem   ${ref} ${reads} > aligned.sam
    """
}