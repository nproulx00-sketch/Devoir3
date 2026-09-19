#!/bin/bash

#This script scans for regions with a scores higher than S in a BED file and sends the output to a new file.
#From this new file, it extracts only the unique chromosomes containing these regions and redirect the result to a final output file.

# Usage: higher_than_S_score_regions.sh <BED_file> <S>

# Output file names
file1="score_above_${2}_$(basename "$1")"
final_file="score_above_${2}_uniq_chrm_$(basename "$1")"

#Scans for regions with a scores higher than S and redirect the output to a new file.

awk -v "S=$2" '$5 > S' "$1" > "$file1" || echo "Failure to process BED_file"

#Keeps only the lines with a unique chromosome name and writes the result in a final output file.

cut -f1 "$file1" | sort | uniq > "$final_file" || echo "Failure to process file1"
