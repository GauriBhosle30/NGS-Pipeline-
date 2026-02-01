include { FASTQC }         from '../modules/fastqc'
include { BWA_ALIGN }      from '../modules/bwa_align'
include { SAMTOOLS_SORT }  from '../modules/samtools_sort'
include { SAMTOOLS_INDEX } from '../modules/samtools_index'
include { VARIANT_CALL }   from '../modules/variant_calling'

workflow VARIANT_WORKFLOW {

    take:
    reads
    ref

    main:

    FASTQC(reads)

    aligned = BWA_ALIGN(reads, ref)

    sorted = SAMTOOLS_SORT(aligned)

    
    indexed = SAMTOOLS_INDEX(sorted)

   
    VARIANT_CALL(indexed, ref)

    emit:
    VARIANT_CALL.out
}
