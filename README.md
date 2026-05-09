# Variant Calling Pipeline using Nextflow 

This repository contains a modular **single-end NGS variant calling pipeline** implemented using **Nextflow DSL2**.  
The pipeline processes raw sequencing reads through quality control, trimming, alignment, and variant calling to identify **SNPs and small INDELs**.

Each analysis step is implemented as a separate, reusable module following Nextflow DSL2 best practices.

---

## Quick Start

```bash
# Clone the repository
git clone https://github.com/GauriBhosle30/NGS-Pipeline-.git
cd NGS-Pipeline-

# Create the Conda environment for pipeline tools
conda env create -f environment.yml

# Activate the environment that runs Nextflow
conda activate bnf

# Run the pipeline
nextflow run main.nf
```

Resume a previous run:

```bash
nextflow run main.nf -resume
```

---

## Pipeline Overview

The pipeline performs the following major steps:

1. Quality control of raw reads
2. Adapter trimming
3. Quality control of trimmed reads
4. Read alignment to a reference genome
5. SAM to BAM conversion
6. BAM sorting and indexing
7. Variant calling
8. Aggregation of QC reports using MultiQC

---

## Repository Structure

```
NGS-Pipeline-/
├── main.nf
├── nextflow.config
├── environment.yml
├── modules/
│   ├── fastqc_raw.nf
│   ├── trim_reads.nf
│   ├── fastqc_trimmed.nf
│   ├── align_reads.nf
│   ├── sam_to_bam.nf
│   ├── sort_index_bam.nf
│   ├── variant_calling.nf
│   └── multiqc.nf
├── workflows/
│   └── variant_calling_wf.nf
├── data/
│   └── exom.fastq
├── reference/
│   └── reference.fa
└── results/
    ├── fastqc/
    ├── trimmed/
    ├── alignment/
    ├── bam/
    └── variantcalling/
```

---

## Input Files

- **Single-end FASTQ file**
  ```
  data/exom.fastq
  ```
- **Reference genome (FASTA format)**
  ```
  reference/reference.fa
  ```

---

## Tools and Software Used

| Tool | Purpose |
|---|---|
| **Nextflow** | Pipeline orchestration (DSL2) |
| **FastQC** | Read quality assessment |
| **Cutadapt** | Adapter trimming |
| **BWA** | Read alignment |
| **Samtools** | SAM/BAM conversion, sorting, indexing |
| **BCFtools** | Variant calling (SNPs & INDELs) |
| **MultiQC** | QC report aggregation |

All tools are installed reproducibly using **Conda** via the provided `environment.yml` file.  
Nextflow automatically manages tool availability during pipeline execution.

---

## Environment Setup

### Prerequisites

- Conda / Miniconda
- Nextflow
- Git

### Create the Conda environment for pipeline tools

```bash
conda env create -f environment.yml
```

This creates a Conda environment named:

```
nextflowpipeline
```

> This environment contains all bioinformatics tools required by the pipeline and is **activated automatically by Nextflow** for each process.

### Activate the environment that runs Nextflow

```bash
conda activate bnf
```

Verify Nextflow installation:

```bash
nextflow -version
```

---

## Pipeline Steps (Detailed)

### 1. Raw Read Quality Control

- **Tool:** FastQC
- **Module:** `modules/fastqc_raw.nf`
- Generates quality metrics for raw FASTQ input files.

---

### 2. Adapter Trimming

- **Tool:** Cutadapt
- **Module:** `modules/trim_reads.nf`
- Removes Illumina adapter sequences from raw reads.

---

### 3. Quality Control After Trimming

- **Tool:** FastQC
- **Module:** `modules/fastqc_trimmed.nf`
- Evaluates the quality of trimmed reads post-adapter removal.

---

### 4. Read Alignment

- **Tool:** BWA-MEM
- **Module:** `modules/align_reads.nf`
- Aligns trimmed reads to the reference genome and outputs a SAM file.

---

### 5. SAM to BAM Conversion

- **Tool:** Samtools
- **Module:** `modules/sam_to_bam.nf`
- Converts SAM alignment output to compressed BAM format.

---

### 6. BAM Sorting and Indexing

- **Tool:** Samtools
- **Module:** `modules/sort_index_bam.nf`
- Sorts and indexes BAM files for downstream variant calling.

---

### 7. Variant Calling

- **Tool:** BCFtools
- **Module:** `modules/variant_calling.nf`
- Identifies SNPs and small INDELs; outputs a VCF file.

---

### 8. MultiQC Report

- **Tool:** MultiQC
- **Module:** `modules/multiqc.nf`
- Aggregates all FastQC reports into a single HTML summary.

---

## Output Files

- FastQC HTML and ZIP reports (raw and trimmed)
- Trimmed FASTQ file
- Aligned SAM file
- Sorted and indexed BAM file
- Variant Call Format file (`variants.vcf`)
- MultiQC HTML summary report

All outputs are saved in the `results/` directory, organized by analysis step.

---

## Configuration

Key parameters are defined in `main.nf`:

```groovy
params.fastq   = "data/exom.fastq"
params.ref     = "reference/reference.fa"
params.outdir  = "results"
params.adapter = "AGATCGGAAGAGC"
```

Resource settings are configured in `nextflow.config`:

- CPUs: 2
- Memory: 4 GB
- Retry strategy enabled

---

## How to Run the Pipeline

From the project root directory, run:

```bash
nextflow run main.nf
```

### Resume Execution

If the pipeline stops or you want to resume from previously completed steps:

```bash
nextflow run main.nf -resume
```

---

## Version Control and GitHub Usage

### Files tracked by Git

- Pipeline scripts (`*.nf`)
- Configuration files (`nextflow.config`)
- `environment.yml`
- `README.md`

### Files excluded from Git

The following are excluded via `.gitignore`:

- `work/`
- `.nextflow/`
- `results/`
- Log files (`*.log`, `nohup.out`)

---

## How to Push Updates to GitHub

```bash
# Stage all changes
git add .

# Commit with a message
git commit -m "Update NGS variant calling pipeline"

# Push to GitHub
git push origin main
```

---

## Notes

- The `work/` directory contains Nextflow's intermediate execution files — **do not delete manually** while a run is in progress.
- The `results/` directory is excluded from version control to keep the repo lightweight.
- Conda environments are **not committed** to Git.
- This pipeline currently supports **single-end sequencing data** only.

---

## Author

**Gauri Bhosle**  
MSc Bioinformatics | Rajiv Gandhi Institute of IT & BT , Bharati Vidyapeeth Deemed University, Pune  
[GitHub: GauriBhosle30](https://github.com/GauriBhosle30)
