#!/bin/bash

# This script downloads each file in ids.txt 
# The id file was downloaded manually through
# www.rcsb.org

# File containing comma-separated PDB IDs
ID_FILE="ids.txt"

# Directory to save downloaded files
SAVE_DIR="../input"

# Log file to record the download status
LOG_FILE="download_log.txt"
> "$LOG_FILE"

IFS=',' read -r -a pdb_ids < "$ID_FILE"

BASE_URL="https://files.rcsb.org/download"

for pdb_id in "${pdb_ids[@]}"; do
    echo "Downloading $pdb_id..."
    if wget -q -P "$SAVE_DIR" "$BASE_URL/$pdb_id.pdb"; then
        echo "$(date '+%Y-%m-%d %H:%M:%S') Successfully downloaded $pdb_id.pdb" | tee -a "$LOG_FILE"
    else
        echo "$(date '+%Y-%m-%d %H:%M:%S') Failed to download $pdb_id.pdb" | tee -a "$LOG_FILE"
    fi
done

echo "Download complete. Check the log file $LOG_FILE for details."
