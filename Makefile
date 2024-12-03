# Define the directories
INPUT_DIR := input
OUTPUT_DIR := output

# Get the list of PDB files in the input directory
PDB_FILES := $(wildcard $(INPUT_DIR)/*.pdb)

# Define the default target
all: download process

# Rule to run download.sh
download:
	@echo "Running download.sh..."
	./download/download.sh

# Rule to process each PDB file in the input directory
process: $(PDB_FILES)
	@echo "Processing PDB files..."
	@mkdir -p $(OUTPUT_DIR)
	@for file in $^; do \
		base_name=$$(basename $$file .pdb); \
		echo "Running pdbx-PNA-torsion-AY for $$file..."; \
		./pdbx-PNA-torsion-AY $$file | tail -n +3 > $(OUTPUT_DIR)/$$base_name.csv; \
	done

# Rule to clean intermediate files
clean:
	@echo "Cleaning intermediate files..."
	rm -f $(OUTPUT_DIR)/*.csv

# Rule to clean all generated files, including outputs
distclean: clean
	@echo "Cleaning all generated files..."
	rm -f $(OUTPUT_DIR)/*.out
	rm -f $(OUTPUT_DIR)/*.log
	rm -f $(OUTPUT_DIR)/*.pdb
	rm -f $(PDB_FILES)

# Phony targets
.PHONY: all download process clean distclean

