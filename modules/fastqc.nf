process FASTQC {

    publishDir "results/fastqc", mode: 'copy'


    input:
    path reads 

    output:
    path "*_fastqc.*"

    script:
    """
    fastqc ${reads}
    """
}