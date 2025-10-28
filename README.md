# Creating a mm10 Custom Reference

This Makefile generates a custom mm10 reference for Cell Ranger ARC by combining the original mm10 genome and GTF with user-defined genes, then creates a JSON config and runs `cellranger-arc mkref` to build the final reference.


# 📁 mm10_scarlet Reference Directory Structure

Here’s the structure of the **mm10_scarlet** reference folder (depth level: 4):

```bash
mm10_scarlet]$ tree -L 4
.
├── fasta
│   ├── genome.fa
│   ├── genome.fa.amb
│   ├── genome.fa.ann
│   ├── genome.fa.bwt
│   ├── genome.fa.fai
│   ├── genome.fa.pac
│   └── genome.fa.sa
├── genes
│   └── genes.gtf.gz
├── reference.json
├── regions
│   ├── transcripts.bed
│   └── tss.bed
└── star
    ├── chrLength.txt
    ├── chrNameLength.txt
    ├── chrName.txt
    ├── chrStart.txt
    ├── exonGeTrInfo.tab
    ├── exonInfo.tab
    ├── geneInfo.tab
    ├── Genome
    ├── genomeParameters.txt
    ├── SA
    ├── SAindex
    ├── sjdbInfo.txt
    ├── sjdbList.fromGTF.out.tab
    ├── sjdbList.out.tab
    └── transcriptInfo.tab

