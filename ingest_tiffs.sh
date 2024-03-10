#!/bin/bash

# Directory where TIFF files are mounted
DATA_DIR="/mnt/data"

# Iterate over TIFF files in the mounted directory and ingest them
for tiff_file in ${DATA_DIR}/*.tif; do
    echo "Ingesting ${tiff_file}..."
    # Assuming "ProductType" is your predefined product type
    # Replace with your actual ingestion command and parameters
    eoxserver-admin.py ingest --type ProductType "${tiff_file}"
done

echo "Ingestion complete."
