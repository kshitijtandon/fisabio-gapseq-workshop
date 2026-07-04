#!/bin/bash
set -e

START=$(date +%s)

echo "==========================================="
echo "Installing Ubuntu dependencies..."
echo "==========================================="

apt-get update -qq > /dev/null

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
    libxml2-dev \
    libsbml5-dev \
    libsbml5 \
    pkg-config > /dev/null

echo "✓ Ubuntu dependencies installed."

echo ""
echo "==========================================="
echo "Cloning gapseq..."
echo "==========================================="

if [ ! -d "gapseq" ]; then
    git clone -q https://github.com/jotech/gapseq.git
fi

cd gapseq

echo "✓ Repository cloned."

echo ""
echo "==========================================="
echo "Installing R dependencies..."
echo "==========================================="

Rscript -e 'install.packages(c("data.table","stringr","getopt","doParallel","foreach","R.utils","stringi","glpkAPI","CHNOSZ","jsonlite","httr"), repos="https://cloud.r-project.org")' > /dev/null

Rscript -e 'if (!requireNamespace("BiocManager", quietly=TRUE)) install.packages("BiocManager", repos="https://cloud.r-project.org"); BiocManager::install("Biostrings", ask=FALSE, update=FALSE)' > /dev/null

Rscript -e 'install.packages("remotes", repos="https://cloud.r-project.org")' > /dev/null

Rscript -e 'remotes::install_github("Waschina/cobrar", upgrade="never")' > /dev/null

echo "✓ R packages installed."

echo ""
echo "==========================================="
echo "Downloading gapseq databases..."
echo "==========================================="

bash ./src/update_sequences.sh > /dev/null

echo "✓ Databases downloaded."

echo ""
echo "==========================================="
echo "Configuring gapseq..."
echo "==========================================="

chmod +x ./gapseq
export PATH="$(pwd):$PATH"

echo "✓ gapseq configured."

echo ""
echo "==========================================="
echo "Running gapseq self-test..."
echo "==========================================="

./gapseq test

echo ""
echo "✅ Installation successful!"

END=$(date +%s)

echo ""
echo "==========================================="
echo "Total installation time: $((END-START)) seconds"
echo "==========================================="