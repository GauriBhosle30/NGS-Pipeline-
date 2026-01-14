include { FASTQC }        from '../modules/fastqc'
include { BWA_ALIGN }     from '../modules/bwa_align'
include { SAMTOOLS_SORT } from '../modules/samtools_sort'
include { VARIANT_CALL }  from '../modules/variant_calling'

workflow VARIANT_WORKFLOW {

    take:
    reads
    ref

    main:
    FASTQC(reads)
    BWA_ALIGN(reads, ref)
    SAMTOOLS_SORT(BWA_ALIGN.out)
    VARIANT_CALL(SAMTOOLS_SORT.out, ref)

    emit:
    VARIANT_CALL.out
}


