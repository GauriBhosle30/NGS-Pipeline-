<h1 align="center"> NGS Pipeline – Nextflow Based Workflow</h1>

<p align="center">
  A Modular & Reproducible Bioinformatics Pipeline for NGS Data Analysis
</p>

---

##  Overview

This repository contains a **Nextflow-based NGS (Next Generation Sequencing) Pipeline**  
designed to perform essential bioinformatics analysis steps in an automated and reproducible way.

###  Key Features
- **Quality Control** – FASTQC
- **Read Alignment** – BWA
- **Sorting & Indexing** – SAMtools
- **Variant Calling**
- **Modular Architecture**
- **Conda Environment Support**
- **Linux / WSL Compatible**

---

##  Project Structure
NGS-Pipeline-/


├── modules/


    └── fastqc.nf

    └── bwa_align.nf
 
    └── samtools_sort.nf
 
    └── samtools_index.nf

    └── variant_calling.nf

├── workflows/

    └── variant_workflow.nf

├── data/ # Input FASTQ files (ignored)

├── results/ # Output results (ignored)

├── work/ # Nextflow temporary files (ignored)
│
├── main.nf

├── nextflow.config

├── environment.yml

└── README.md


---

## ⚙️ Requirements

| Tool | Version |
|------|--------|
| Java | 11+ |
| Nextflow | Latest |
| Conda / Miniconda | Latest |
| Git | Latest |
| Linux / WSL | Recommended |

---

##  Installation and Output

```bash
### 1. Clone the Repository
```bash
git clone https://github.com/GauriBhosle30/NGS-Pipeline-.git
cd NGS-Pipeline-

### 2. Create Conda Environment
```bash
conda env create -f environment.yml
conda activate bnf

### 3. Install Nextflow (If Not Installed)
```bash
curl -s https://get.nextflow.io | bash
sudo mv nextflow /usr/local/bin/

### 4.Running the Pipeline
Place your FASTQ files inside the data/ folder.

Run the pipeline:
```bash
nextflow run main.nf --reads "data/*.fastq" --outdir results

---

## Output

All results will be generated inside the `results/` directory:

### FASTQC Reports
FASTQC summary reports of your sequencing reads.

### Sorted BAM Files
BAM files sorted by genomic coordinates.

### Indexed BAM Files
Indexed versions of the sorted BAM files for efficient access.

### Variant VCF Files
Variant Call Format files containing detected genetic variants.


---


##Cleaning Temporary Files

To remove cached and temporary files:

nextflow clean -f

---

##Customization

You can modify parameters inside nextflow.config such as:

-Output Directory

-CPU / Memory Usage

-Tool Paths

-Execution Profiles

-Ignored Files

---

## The following folders are excluded using .gitignore:

- data/

- results/

- work/

- .nextflow/

