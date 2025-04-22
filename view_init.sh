#!/bin/bash

# Script to extract package names from all _init files,
# excluding ServiceStack packages and removing the "dotnet add package" prefix
# Usage: ./concatenate_init_files.sh [directory] [output_file]

# Set directory to current directory if not specified
DIR="${1:-.}"
# Set default output file name if not specified
OUTPUT_FILE="${2:-dotnet_packages.txt}"

# Check if directory exists
if [ ! -d "$DIR" ]; then
    echo "Error: Directory '$DIR' does not exist."
    exit 1
fi

# Create or clear the output file
> "$OUTPUT_FILE"

# Find all _init files recursively and extract package names
echo "Finding all _init files in '$DIR' and extracting non-ServiceStack package names..."

find "$DIR" -type f -name "_init" -print | while read -r file; do
    echo "Processing: $file"
    
    # Add a header for each file to identify its source
    # echo -e "\n# Package references from: $file" >> "$OUTPUT_FILE"
    
    # Extract package names, exclude ServiceStack packages, and remove the prefix
    grep "^dotnet add package " "$file" | grep -v "ServiceStack" | sed 's/^dotnet add package //' >> "$OUTPUT_FILE" || echo "# No eligible package references found in this file" >> "$OUTPUT_FILE"
done

# Check if any content was added (excluding comment lines)
if [ $(grep -v "^#" "$OUTPUT_FILE" | wc -l) -eq 0 ]; then
    echo "No eligible package references found in any _init files."
    rm "$OUTPUT_FILE"
    exit 0
fi

# Count the number of package references
PACKAGE_COUNT=$(grep -v "^#" "$OUTPUT_FILE" | wc -l)

echo "Extraction complete. Output saved to '$OUTPUT_FILE'"
echo "Found $PACKAGE_COUNT non-ServiceStack package references in total"