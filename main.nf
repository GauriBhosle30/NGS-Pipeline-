nextflow.enable.dsl = 2

include { VARIANT_WORKFLOW } from './workflows/variant_workflow'

workflow {

    reads = file('data/Sample1.fasta.fastq')
    ref   = file('data/chr22.fa')

    VARIANT_WORKFLOW(reads, ref)
}
