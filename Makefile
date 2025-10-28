# Path to original ARC mm10 reference
MM10 = /nfs/turbo/umms-thahoang/sherine/REFERENCES/refdata-cellranger-arc-mm10-2020-A-2.0.0
CELLRANGER = /nfs/turbo/umms-thahoang/sherine/tools/cellranger-arc-2.0.2

# Names of new files in current directory
CUSTOM_FASTA = NewGenes.fa
CUSTOM_GTF   = NewGenes.gtf
GENOME_FA    = mm10_scarlet.fa
GENES_GTF    = mm10_scarlet.gtf
CONFIG_JSON  = mm10_scarlet_config.json
MKREF_DIR    = mm10_scarlet

# Step 1: Generate custom FASTA
$(CUSTOM_FASTA):
	python getFasta.py > $(CUSTOM_FASTA)

# Step 2: Generate custom GTF

$(CUSTOM_GTF):
	echo -e 'Neurog2-9SA\tmanual\texon\t1\t789\t.\t+\t.\tgene_id "Neurog2-9SA"; transcript_id "Neurog2-9SA";' > $(CUSTOM_GTF)
	echo -e 'mScarlet3\tmanual\texon\t1\t690\t.\t+\t.\tgene_id "mScarlet3"; transcript_id "mScarlet3";' >> $(CUSTOM_GTF)

# Step 3: Combine original mm10 reference + custom genes
custom_ref: $(CUSTOM_FASTA) $(CUSTOM_GTF)
	# Combine genome FASTA
	cat $(MM10)/fasta/genome.fa $(CUSTOM_FASTA) > $(GENOME_FA)
	# Combine GTF (uncompress original on the fly)
	zcat $(MM10)/genes/genes.gtf.gz > temp_gtf.fa
	cat temp_gtf.fa $(CUSTOM_GTF) > $(GENES_GTF)
	rm temp_gtf.fa
	@echo "Custom reference files $(GENOME_FA) and $(GENES_GTF) created in current directory."

# Step 4: Create proper JSON config for Cell Ranger ARC mkref
$(CONFIG_JSON): custom_ref
	@echo '{' > $(CONFIG_JSON)
	@echo '    "organism": "mouse",' >> $(CONFIG_JSON)
	@echo '    "genome": ["mm10_scarlet"],' >> $(CONFIG_JSON)
	@echo '    "input_fasta": ["$(GENOME_FA)"],' >> $(CONFIG_JSON)
	@echo '    "input_gtf": ["$(GENES_GTF)"]' >> $(CONFIG_JSON)
	@echo '}' >> $(CONFIG_JSON)
	@echo "✅ Config JSON $(CONFIG_JSON) created for Cell Ranger ARC mkref."

# Step 5: Run Cell Ranger ARC mkref
mkref: $(CONFIG_JSON)
	$(CELLRANGER)/cellranger-arc mkref --config=$(CONFIG_JSON) 
	@echo "✅ Cell Ranger ARC custom reference $(MKREF_DIR) created successfully."

