#!/bin/bash
set -e

echo "Installing system dependencies..."
apt-get update -qq
apt-get install -y -qq \
    git \
    wget \
    curl \
    ncbi-blast+ \
    bedtools \
    barrnap \
    bc \
    parallel \
    r-base-core \
    libglpk-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev

echo "Cloning gapseq..."
if [ ! -d "gapseq" ]; then
    git clone https://github.com/jotech/gapseq.git
fi

cd gapseq

echo "Installing required R packages..."
Rscript -e 'install.packages(c("data.table","stringr","getopt","doParallel","foreach","R.utils","stringi","glpkAPI","CHNOSZ","jsonlite","httr"), repos="https://cloud.r-project.org")'

Rscript -e 'if (!requireNamespace("BiocManager", quietly=TRUE)) install.packages("BiocManager", repos="https://cloud.r-project.org"); BiocManager::install("Biostrings", ask=FALSE, update=FALSE)'

echo "Downloading gapseq sequence databases..."
bash ./src/update_sequences.sh

echo "Adding gapseq to PATH..."
chmod +x ./gapseq
export PATH="$(pwd):$PATH"

echo ""
echo "Installation finished."
echo "Testing gapseq..."
./gapseq test