include { VARIANT_WORKFLOW } from './workflows/variant_workflow'

workflow {

    reads = channel
        .fromPath(params.reads)
        .map { file ->
            tuple(file.baseName, file)
        }

    ref = file(params.ref)

    VARIANT_WORKFLOW(reads, ref)
}
