process SAMTOOLS_SORT {

    publishDir "results/bam", mode: 'copy'


    input:
    path sam

    output:
    path "sorted.bam"

    script:
    """

    samtools view -Sb ${sam} |samtools sort -o sorted.bam
    samtools index sorted.bam
    """
}