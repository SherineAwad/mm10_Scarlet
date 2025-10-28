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

``` 
### Snapshot of Slurm run for Cell Ranger ARC custom reference

[BWTIncConstructFromPacked] 610 iterations done. 5454101738 characters processed.  
[bwt_gen] Finished constructing BWT in 614 iterations.  
[bwa_index] 1856.12 seconds elapse.  
[bwa_index] Update BWT... 16.89 sec  
[bwa_index] Pack forward-only FASTA... 10.54 sec  
[bwa_index] Construct SA from BWT and Occ... 840.44 sec  
[main] Version: 0.7.17-r1188  
[main] CMD: bwa index /nfs/turbo/umms-thahoang/sherine/Custom_Ref/mm10_scarlet/fasta/genome.fa  
[main] Real time: 2792.803 sec; CPU: 2739.989 sec  
done  

Writing TSS and transcripts bed file...  
...done  

Writing genome metadata JSON file into reference folder...  
Computing hash of genome FASTA file...  
...done  

Computing hash of genes GTF file...  
...done  

...done  

>>> Reference successfully created at mm10_scarlet <<<  

✅ Cell Ranger ARC custom reference mm10_scarlet created successfully.

